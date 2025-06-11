//  ProductRemoteDataSourceImpl.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 09/06/2025.
//

import Foundation
import Shopify
import Apollo

class ProductRemoteDataSourceImpl: ProductRemoteDataSource {
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getProductById(productID: ID, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        networkService.queryRequest(query:GetProductByIDQuery(id: productID)) { result in
            switch result {
            case .success(let GraphQLResult):
                if let product = GraphQLResult.data?.product{
                    let productEntity = product.toDomainModel()
                    completionHandler(.success(productEntity))
                }else{
                    completionHandler(.failure(NSError(domain: "No product is fetched", code: 404, userInfo: nil)))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func createProduct(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        networkService.mutaionRequest(
            mutation:CreateProductMutation(
                title: product.title ?? ""
              ,descriptionHtml: product.descriptionHTML ?? ""
              ,productType: product.productType ?? ""
              , vendor: product.vendor ?? "")) { result in
            switch result {
            case .success(let GraphQLResult):
                if let product = GraphQLResult.data?.productCreate?.product{
                    let productEntity = product.toDomailModel()
                    completionHandler(.success(productEntity))
                }else{
                    completionHandler(.failure((GraphQLResult.errors?.first)!))
                }
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
    func createProductOptions(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        guard let productID = product.id else {
            completionHandler(.failure(ProductError.missingValue(field: "product id")))
            return
        }
        
        let mutation: CreateProductOptionsMutation = CreateProductOptionsMutation(
            id: productID,
            productOptions: product.options?.map{$0.toDomainDTO()} ?? []
        )
        networkService.mutaionRequest(mutation: mutation) { result in
            switch result {
            case .success(let success):
                if let product = success.data?.productOptionsCreate?.product {
                    let entity = product.toDomainModel()
                    completionHandler(.success(entity))
                } else if let errors = success.errors {
                    let errorMessage = errors.compactMap(\.message).joined(separator: ", ")
                    completionHandler(.failure(NSError(domain: errorMessage, code: -1)))
                }
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
    func updateProductVariant(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        guard let productID = product.id else {
            completionHandler(.failure(ProductError.missingValue(field: "product id")))
            return
        }
        
        networkService.mutaionRequest(mutation: UpdateProductVariantsMutation(productId: productID, variants: product.variants?.map{$0.toDomainDTO()} ?? [])) { result in
            switch result {
            case .success(let graphQLResult):
                if let product = graphQLResult.data?.productVariantsBulkUpdate?.product{
                    let entity = product.toDomainModel()
                    completionHandler(.success(entity))
                }else if let errors = graphQLResult.errors{
                    let message = errors.first?.message ?? "No Variant"
                    completionHandler(.failure(NSError(domain: message, code: -1)))
                }
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
    func setInventory(inventory: InventoryEntity, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        networkService.mutaionRequest(mutation: SetInventoryQuantityMutation(input: inventory.toDomainDTO())) { result in
            switch result {
            case .success(_):
                completionHandler(.success(true))
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
    func createProductVariants(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        guard let productID = product.id else {
            completionHandler(.failure(ProductError.missingValue(field: "product id")))
            return
        }
        let mutation = CreateProductVariantsMutation(id: productID, variants: product.variants?.map{$0.toDomainDTO()} ?? [])
        networkService.mutaionRequest(mutation: mutation) { result in
            switch result {
            case .success(let graphQlResult):
                if let product = graphQlResult.data?.productVariantsBulkCreate?.product{
                    let entity = product.toDomainModel()
                    completionHandler(.success(entity))
                }else if let errors = graphQlResult.data?.productVariantsBulkCreate?.userErrors{
                    let message = errors.first?.message ?? "No Variant"
                    completionHandler(.failure(NSError(domain: message, code: -1)))
                }
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
}

enum ProductError: Error {
    case missingValue(field: String)
}

extension ProductError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .missingValue(let field):
            return "value for \(field) is missing."
        }
    }
}

//
//  Network.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import Apollo
import Foundation
import Shopify

class NetworkService : NetworkServiceProtocol {
    
    static let shared = NetworkService()
    private lazy var store = ApolloStore()
    private let accessToken = ProcessInfo.processInfo.environment["Admin_Access_Token"] ?? ""

    private(set) lazy var apollo: ApolloClient = {
        let url = URL(string: "https://mad45-ios1-sv.myshopify.com/admin/api/2025-04/graphql.json")!
        let config = URLSessionConfiguration.ephemeral
        let sessionClient = URLSessionClient(sessionConfiguration: config)

        let transport = RequestChainNetworkTransport(
            interceptorProvider: DefaultInterceptorProvider(client: sessionClient, shouldInvalidateClientOnDeinit: true, store: store),
            endpointURL: url,
            additionalHeaders: [
                "X-Shopify-Access-Token": accessToken,
                "Content-Type": "application/json"
            ]
        )
        
        return ApolloClient(networkTransport: transport, store: store)
    }()
    
    func getAllProducts(completionHandler : @escaping (Result<[GetProductsQuery.Data.Products.Node],Error>)->Void) {
        NetworkService.shared.apollo.fetch(query: GetProductsQuery(),cachePolicy: .fetchIgnoringCacheCompletely){ result in
            switch result {
            case .success(let graphQLResult):
                if let products = graphQLResult.data?.products.nodes {
                    print(products)
                    completionHandler(.success(products))
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors: \(errors)")
                    completionHandler(.failure(NSError(domain: "No Products are Fetched", code: 404, userInfo: nil)))
                }
            case .failure(let error):
                print("Network or decoding error: \(error)")
                completionHandler(.failure(error))
            }
        }
    }
    
    func getAllVendors(completionHandler: @escaping (Result<[GetAllVendorsQuery.Data.Collections.Node], Error>) -> Void) {
        NetworkService.shared.apollo.fetch(query: GetAllVendorsQuery(),cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let vendors = graphQLResult.data?.collections.nodes{
                    let filteredVendors = vendors.filter { $0.image != nil }
                    completionHandler(.success(filteredVendors))
                } else {
                    completionHandler(.failure(NSError(domain: "NoVendors", code: 404, userInfo: nil)))
                }
            case .failure(let error):
                print("Error: \(error)")
                completionHandler(.failure(error))
            }
        }
    }
    
    func getVendorProducts(vendorName :String,completionHandler: @escaping (Result<[GetVendorProductsQuery.Data.Products.Node], any Error>) -> Void){
        NetworkService.shared.apollo.fetch(query: GetVendorProductsQuery(vendor: vendorName),cachePolicy: .fetchIgnoringCacheCompletely){ result in
            switch result {
            case .success(let graphQlResult) :
                if let products = graphQlResult.data?.products.nodes{
                    completionHandler(.success(products))
                } else {
                    completionHandler(.failure(NSError(domain: "NoVendors", code: 404, userInfo: nil)))
                }
            case .failure(let error) :
                print("Error: \(error)")
                completionHandler(.failure(error))
            }
            
        }
    }
    
    func getProductByID(productID : ID ,completionHandler: @escaping (Result<GetProductByIDQuery.Data.Product,Error>)->Void){
        NetworkService.shared.apollo.fetch(query: GetProductByIDQuery(id: productID),cachePolicy: .fetchIgnoringCacheCompletely){ result in
            switch result {
            case .success(let graohQLResult) :
                if let product = graohQLResult.data?.product{
                    completionHandler(.success(product))
                }else{
                    completionHandler(.failure(NSError(domain: "NoVendors", code: 404, userInfo: nil)))
                }
            case .failure(let error) :
                completionHandler(.failure(error))
            }
            
        }
    }
    
    func createProduct(title: String, description: String, productType: String, vendor: String, completionHandler: @escaping (Result<CreateProductMutation.Data.ProductCreate.Product, any Error>) -> Void) {
        NetworkService.shared.apollo.perform(mutation: CreateProductMutation(title: title, descriptionHtml: description, productType: productType, vendor: vendor)){ result in
            switch result {
                 case .success(let graphQLRresult) :
                if let product = graphQLRresult.data?.productCreate?.product{
                    print(product.id)
                    completionHandler(.success(product))
                }else{
                    completionHandler(.failure(NSError(domain: "No ID Found", code: 404, userInfo: nil)))
                }
            case .failure(let error) :
                completionHandler(.failure(error))
            }
        }
    }
    
    func createProductOptions(id : ID, productOptions : [OptionCreateInput] ,completionHandler : @escaping (Result<CreateProductOptionsMutation.Data.ProductOptionsCreate.Product,Error>)->Void){
        NetworkService.shared.apollo.perform(mutation: CreateProductOptionsMutation(id: id, productOptions: productOptions)){ result in
            switch result {
                case .success(let response) :
                if let product = response.data?.productOptionsCreate?.product{
                    print(product.options)
                    completionHandler(.success(product))
                }else{
                    completionHandler(.failure(NSError(domain: "No ID Found", code: 404, userInfo: nil)))
                }
            case .failure(let error) :
                completionHandler(.failure(error))
            }
        }
    }
    
    func createProductMedia(id : ID, media : [CreateMediaInput], completionHandler : @escaping (Result<Bool,Error>)->Void){
        NetworkService.shared.apollo.perform(mutation: CreateProductMediaMutation(id: id, media: media)){ result in
            switch result {
                case .success(_) :
                completionHandler(.success(true))
            case .failure(let error) :
                completionHandler(.failure(error))
            }
        }
    }

    func createProductVariants(id: ID, variants: [ProductVariantsBulkInput], completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        NetworkService.shared.apollo.perform(mutation: CreateProductVariantsMutation(id: id, variants: variants)){
            result in
            switch result {
            case .success(let response):
                let variants = response.data?.productVariantsBulkCreate?.product?.variants.nodes
                print(variants?.count ?? 0)
                print(variants?.first?.title ?? "No Title Found for this variant")
                print(response.data?.productVariantsBulkCreate?.userErrors.first?.message  ?? "No Error Found")
                completionHandler(.success(true))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func deleteProductByID(id: ID, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        NetworkService.shared.apollo.perform(mutation: DeleteProductByIDMutation(id: id)){ result in
            switch result{
            case .success(let result):
                if let id = result.data?.productDelete?.deletedProductId{
                    print(id)
                    print(result.data?.productDelete?.userErrors.first?.message ?? "No error")
                    completionHandler(.success(true))
                }else{
                    completionHandler(.failure(NSError(domain: "No ID Found", code: 404, userInfo: nil)))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func updateProductVariant(productID: ID, variants : [ProductVariantsBulkInput], completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        NetworkService.shared.apollo.perform(mutation: CreateProductVariantsMutation(id: productID, variants: variants)){ result in
            switch result{
                case .success(let result):
                if let variants = result.data?.productVariantsBulkCreate?.product?.variants{
                    print(variants.nodes.first?.title ?? "No Variants")
                    completionHandler(.success(true))
                }else {
                    completionHandler(.failure(NSError(domain: "No Variants Found", code: 404, userInfo: nil)))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func setInventoryQuantity(inventoryQuantity: InventorySetQuantitiesInput, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        NetworkService.shared.apollo.perform(mutation: SetInventoryQuantityMutation(input: inventoryQuantity)){ result in
            switch result{
            case .success(let graphQLResult) :
                print(graphQLResult)
                completionHandler(.success(true))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}

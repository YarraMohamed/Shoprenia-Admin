//
//  MockNetworkService.swift
//  Shoprenia-AdminTests
//
//  Created by Abdullah Raed on 24/06/2025.
//

import Foundation
@testable import Shoprenia_Admin
import Shopify
import Apollo

final class MockNetworkService: NetworkService {
    func mutaionRequest<M>(mutation: M, completionHandler: @escaping (Result<Apollo.GraphQLResult<M.Data>, any Error>) -> Void) where M : ApolloAPI.GraphQLMutation {
        
            let mockData = self.createMockData(for: M.self)
            let result = GraphQLResult(data: mockData, extensions: nil, errors: nil, source: .server, dependentKeys: nil)
            completionHandler(.success(result))
        
    }
    
    func queryRequest<Q>(query: Q, completionHandler: @escaping (Result<Apollo.GraphQLResult<Q.Data>, any Error>) -> Void) where Q : ApolloAPI.GraphQLQuery {
        
    }
    
    
    private func createMockData<M: GraphQLMutation>(for type: M.Type) -> M.Data? {
           // You must return M.Data here
        if M.self == CreateProductMutation.self {
            return CreateProductMutation(title: "Test", descriptionHtml: "Description", productType: "type", vendor: "vendor", media: []) as? M.Data
        }else if M.self == CreateProductOptionsMutation.self {
            return CreateProductOptionsMutation(id: "id", productOptions: []) as? M.Data
        }else if M.self == CreateProductVariantsMutation.self {
            return CreateProductVariantsMutation(id: "id", variants: []) as? M.Data
        }else if M.self == PublishProductMutation.self {
            return PublishProductMutation(productId: "id", publicationId: "publicationID") as? M.Data
        }else if M.self == SetInventoryQuantityMutation.self {
            return SetInventoryQuantityMutation(input: InventorySetQuantitiesInput.init(reason: "available", name: "name", referenceDocumentUri: nil, quantities: [InventoryQuantityInput.init(inventoryItemId: "id", locationId: "locationId", quantity: 10)], ignoreCompareQuantity: nil)) as? M.Data
        }else if M.self == UpdateProductVariantsMutation.self {
            return UpdateProductVariantsMutation(productId: "Id", variants: []) as? M.Data
        }else if M.self == DeleteProductByIDMutation.self{
            return DeleteProductByIDMutation(id: "id") as? M.Data
        }else{
            return nil
        }
        
       }
    
}

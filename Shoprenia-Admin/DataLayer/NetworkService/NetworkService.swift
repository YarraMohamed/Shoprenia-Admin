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
        NetworkService.shared.apollo.fetch(query: GetProductsQuery()){ result in
            switch result {
            case .success(let graphQLResult):
                if let products = graphQLResult.data?.products.nodes {
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
        NetworkService.shared.apollo.fetch(query: GetAllVendorsQuery()) { result in
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
        NetworkService.shared.apollo.fetch(query: GetVendorProductsQuery(vendor: vendorName)){ result in
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
        NetworkService.shared.apollo.fetch(query: GetProductByIDQuery(id: productID)){ result in
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
    
}

//
//  Network.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import Apollo
import Foundation
import Shopify

class NetworkServiceImpl : NetworkService {
    
    static let shared = NetworkServiceImpl()
    private var store = ApolloStore()
    private let accessToken = ADMIN_ACCESS_TOKEN
    
    let apollo: ApolloClient
    
    private init() {
        let url = URL(string: "https://mad45-ios1-sv.myshopify.com/admin/api/2025-04/graphql.json")!
        let config = URLSessionConfiguration.ephemeral
        let sessionClient = URLSessionClient(sessionConfiguration: config)

        let transport = RequestChainNetworkTransport(
            interceptorProvider: DefaultInterceptorProvider(client: sessionClient, shouldInvalidateClientOnDeinit: true, store: self.store),
            endpointURL: url,
            additionalHeaders: [
                "X-Shopify-Access-Token": accessToken,
                "Content-Type": "application/json"
            ]
        )
        
        apollo = ApolloClient(networkTransport: transport, store: self.store)
    }
    
    func getAllProducts(completionHandler : @escaping (Result<[GetProductsQuery.Data.Products.Node],Error>)->Void) {
        NetworkServiceImpl.shared.apollo.fetch(query: GetProductsQuery(),cachePolicy: .fetchIgnoringCacheCompletely){ result in
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
        NetworkServiceImpl.shared.apollo.fetch(query: GetAllVendorsQuery(),cachePolicy: .fetchIgnoringCacheCompletely) { result in
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
    
    func queryRequest<Q: GraphQLQuery>(query : Q, completionHandler : @escaping (Result<GraphQLResult<Q.Data>, any Error>)->Void){
        NetworkServiceImpl.shared.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely, resultHandler: completionHandler)
    }
    
    func mutaionRequest<M: GraphQLMutation>(mutation : M , completionHandler : @escaping (Result<GraphQLResult<M.Data>,any Error>)->Void){
        NetworkServiceImpl.shared.apollo.perform(mutation: mutation , resultHandler: completionHandler)
    }
}
        

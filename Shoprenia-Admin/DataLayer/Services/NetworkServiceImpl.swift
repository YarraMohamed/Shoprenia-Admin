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
    
    func queryRequest<Q: GraphQLQuery>(query : Q, completionHandler : @escaping (Result<GraphQLResult<Q.Data>, any Error>)->Void){
        NetworkServiceImpl.shared.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely, resultHandler: completionHandler)
    }
    
    func mutaionRequest<M: GraphQLMutation>(mutation : M , completionHandler : @escaping (Result<GraphQLResult<M.Data>,any Error>)->Void){
        NetworkServiceImpl.shared.apollo.perform(mutation: mutation , resultHandler: completionHandler)
    }
}
        

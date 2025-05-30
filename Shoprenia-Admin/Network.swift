//
//  Network.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import Apollo
import Foundation

class Network {
    static let shared = Network()
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
}

//
//  NetworkServiceProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//


import Foundation
import Shopify
import Apollo

protocol NetworkService {
    func mutaionRequest<M: GraphQLMutation>(mutation : M , completionHandler : @escaping (Result<GraphQLResult<M.Data>,any Error>)->Void)
    func queryRequest<Q: GraphQLQuery>(query : Q, completionHandler : @escaping (Result<GraphQLResult<Q.Data>, any Error>)->Void)
}

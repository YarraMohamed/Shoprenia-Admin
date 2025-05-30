//
//  FetchProductsUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import Foundation
import Shopify

class FetchProductsUsecase : FetchProductsUsecaseProtocol{
    
    let networkService : NetworkServiceProtocol
    
    func excute(completionHandler: @escaping (Result<[GetProductsQuery.Data.Products.Node], any Error>) -> Void) {
        networkService.getAllProducts(completionHandler: completionHandler)
    }

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}

//
//  FetchProductsUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import Foundation
import Shopify

class FetchProductsUsecase : FetchProductsUsecaseProtocol{
    
    let networkService : NetworkService
    
    func excute(completionHandler: @escaping (Result<[GetProductsQuery.Data.Products.Node], any Error>) -> Void) {
        NetworkServiceImpl.shared.getAllProducts(completionHandler: completionHandler)
    }

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

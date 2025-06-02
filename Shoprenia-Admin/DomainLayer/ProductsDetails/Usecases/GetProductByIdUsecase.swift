//
//  GetProductByIdUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 03/06/2025.
//

import Foundation
import Shopify


class GetProductByIdUsecase : GetProductByIdUsecaseProtocol {
   
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func excute(id : ID,completionHandler: @escaping (Result<Shopify.GetProductByIDQuery.Data.Product, any Error>) -> Void) {
        networkService.getProductByID(productID: id, completionHandler: completionHandler)
    }
    
}



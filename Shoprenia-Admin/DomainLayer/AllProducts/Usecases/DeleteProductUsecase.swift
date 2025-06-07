//
//  DeleteProductUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 07/06/2025.
//

import Foundation
import Shopify


class DeleteProductUsecase : DeleteProductUsecaseProtocol {
    
    let networkService : NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func excute(id: ID, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        networkService.deleteProductByID(id: id, completionHandler: completionHandler)
    }
}

//
//  CreateProductUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation

class CreateProductUsecase : CreateProductUsecaseProtocol {
   
    let networkService : NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func excute(title: String, description: String, productType: String, vendor: String, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        networkService.createProduct(title: title, description: description, productType: productType, vendor: vendor, completionHandler: completionHandler)
    }
    
    
}

//
//  FetchProductsUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import Foundation
import Shopify

class FetchProductsUsecaseImpl : FetchProductsUsecase{
    
    let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    func execute(completionHandler: @escaping (Result<[ProductEntity], any Error>) -> Void) {
        repository.getAllProducts(completionHandler: completionHandler)
    }
}

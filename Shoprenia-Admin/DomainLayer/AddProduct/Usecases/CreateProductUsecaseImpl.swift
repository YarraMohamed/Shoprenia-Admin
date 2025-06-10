//
//  CreateProductUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation
import Shopify

class CreateProductUsecaseImpl : CreateProductUsecase {
   
    let repository : ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        repository.createProduct(product: product, completionHandler: completionHandler)
    }
    
}

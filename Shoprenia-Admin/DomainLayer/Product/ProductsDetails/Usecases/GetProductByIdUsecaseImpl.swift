//
//  GetProductByIdUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 03/06/2025.
//

import Foundation
import Shopify


class GetProductByIdUsecaseImpl : GetProductByIdUsecase {
   
    let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute(id : ID,completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        repository.getProductById(productID: id, completionHandler: completionHandler)
    }
    
}



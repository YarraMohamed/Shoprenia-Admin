//
//  DeleteProductUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 07/06/2025.
//

import Foundation
import Shopify


class DeleteProductUsecaseImpl : DeleteProductUsecase {
    
    let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute(productID: ID, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        repository.deleteProduct(productID: productID, completionHandler: completionHandler)
    }
}

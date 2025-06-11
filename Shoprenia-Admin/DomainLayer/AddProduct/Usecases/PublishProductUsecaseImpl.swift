//
//  PublishProductUsecaseImpl.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 12/06/2025.
//

import Foundation
import Shopify


class PublishProductUsecaseImpl: PublishProductUsecase {
    
    let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute(productID: ID, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        repository.publishProduct(productID: productID, completionHandler: completionHandler)
    }
}

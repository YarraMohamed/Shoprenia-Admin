//
//  UpdateProductVariantUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 08/06/2025.
//

import Foundation
import Shopify

class UpdateProductVariantUsecaseImpl : UpdateProductVariantUsecase {
    
    let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        repository.updateProductVariant(product: product, completionHandler: completionHandler)
    }
    
}

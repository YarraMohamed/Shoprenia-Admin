//
//  CreateProductVariantsUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 07/06/2025.
//

import Foundation
import Shopify

class CreateProductVariantsUsecaseImpl : CreateProductVariantsUsecase {
    let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    func execute(product : ProductEntity , completionHandler : @escaping (Result<ProductEntity,Error>)->Void) {
        repository.createProductVariants(product: product, completionHandler: completionHandler)
    }
}

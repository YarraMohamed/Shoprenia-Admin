//
//  SetInventoryQuantityUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 08/06/2025.
//

import Foundation
import Shopify

class SetInventoryQuantityUsecaseImpl : SetInventoryQuantityUsecase {
    
    let repository : ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute(inventory: InventoryEntity, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        repository.setInventory(inventory: inventory, completionHandler: completionHandler)
    }
}


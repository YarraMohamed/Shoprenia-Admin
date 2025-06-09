//
//  SetInventoryQuantityUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 08/06/2025.
//

import Foundation
import Shopify

class SetInventoryQuantityUsecase : SetInventoryQuantityUsecaseProtocol {
    
    let networkService : NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    func excute(inventoryQuantity: InventorySetQuantitiesInput, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        networkService.setInventoryQuantity(inventoryQuantity: inventoryQuantity, completionHandler: completionHandler)
    }
}


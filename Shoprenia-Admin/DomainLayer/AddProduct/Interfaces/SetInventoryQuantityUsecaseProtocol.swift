//
//  SetInventoryQuantityUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 08/06/2025.
//

import Foundation
import Shopify

protocol SetInventoryQuantityUsecaseProtocol {
    
    func excute(inventoryQuantity: InventorySetQuantitiesInput, completionHandler: @escaping (Result<Bool, any Error>) -> Void)
    
}

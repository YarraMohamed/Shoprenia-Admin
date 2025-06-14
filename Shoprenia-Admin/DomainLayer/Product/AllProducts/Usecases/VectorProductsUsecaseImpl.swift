//
//  VectorProductsUsecaseImpl.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation

class VectorProductsUsecaseImpl : VendorProductsUsecase {
    let repository : ProductRepository
    init(repository: ProductRepository) {
        self.repository = repository
    }
    func execute(vendorName: String, completionHndeler: @escaping (Result<[ProductEntity], any Error>) -> Void) {
        repository.getVendorProducts(vendorName: vendorName, completionHandler: completionHndeler)
    }
}

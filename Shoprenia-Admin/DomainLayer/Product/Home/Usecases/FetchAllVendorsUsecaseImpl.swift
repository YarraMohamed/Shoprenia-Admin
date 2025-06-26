//
//  FetchAllVendorsUsecaseImpl.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 16/06/2025.
//

import Foundation

class FetchAllVendorsUsecaseImpl : FetchAllVendorsUsecase {
    
    let repository : ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute(completionHandler: @escaping (Result<[VendorEntity], any Error>) -> Void) {
        repository.getAllVendors(completionHandler: completionHandler)
    }
}

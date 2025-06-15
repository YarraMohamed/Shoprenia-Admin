//
//  DeleteDiscountCodeUsecaseImpl.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 15/06/2025.
//

import Foundation
import Shopify

class DeleteDiscountCodeUsecaseImpl: DeleteDiscountCodeUsecase {
    
    let repository : CouponsRepository
    init(repository: CouponsRepository) {
        self.repository = repository
    }
    func execute(id: ID, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        repository.deleteDiscountCodeById(id: id, completionHandler: completionHandler)
    }
}

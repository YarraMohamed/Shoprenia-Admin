//
//  FetchAllCouponsUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation


class FetchAllCouponsUsecaseImpl : FetchAllCouponsUsecase {
    
    let repository : CouponsRepository
    
    init(repository: CouponsRepository) {
        self.repository = repository
    }
    
    func execute(completionHandler: @escaping (Result<[DiscountEntity], any Error>) -> Void) {
        repository.getAllCoupons(completionHandler: completionHandler)
    }
}

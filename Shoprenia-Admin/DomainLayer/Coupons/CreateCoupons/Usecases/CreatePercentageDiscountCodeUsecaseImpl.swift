//
//  CreateCouponUsecaseImpl.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation

class CreatePercentageDiscountCodeUsecaseImpl: CreatePercentageDiscountCodeUsecase {
    let repository : CouponsRepository
    
    init(repository: CouponsRepository) {
        self.repository = repository
    }
    
    func execute(coupon: CouponEntity, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        repository.createPercentageDiscountCode(coupon: coupon, completionHandler: completionHandler)
    }
}

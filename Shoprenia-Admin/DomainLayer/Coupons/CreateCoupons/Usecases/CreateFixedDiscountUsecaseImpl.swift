//
//  CreateFixedDiscountUsecaseImpl.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 15/06/2025.
//

import Foundation

class CreateFixedDiscountUsecaseImpl : CreateFixedDiscountUsecase {
    
    let repository : CouponsRepository
    init(repository: CouponsRepository) {
        self.repository = repository
    }
    
    func execute(coupon: CouponEntity, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        repository.createFixedDiscountCode(coupon: coupon, completionHandler: completionHandler)
    }
}

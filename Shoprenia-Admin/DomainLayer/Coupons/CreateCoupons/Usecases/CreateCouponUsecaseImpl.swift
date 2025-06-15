//
//  CreateCouponUsecaseImpl.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation

class CreateCouponUsecaseImpl: CreateCouponUsecase {
    let repository : CouponsRepository
    
    init(repository: CouponsRepository) {
        self.repository = repository
    }
    
    func execute(coupon: CouponEntity, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        repository.createCoupon(coupon: coupon, completionHandler: completionHandler)
    }
}

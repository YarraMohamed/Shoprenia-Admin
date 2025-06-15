//
//  CreateCouponUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation

protocol CreatePercentageDiscountCodeUsecase{
    func execute(coupon : CouponEntity , completionHandler: @escaping (Result<Bool,Error>) -> Void)
}

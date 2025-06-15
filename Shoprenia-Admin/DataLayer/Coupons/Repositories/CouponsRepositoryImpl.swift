//
//  CopounsRepositoryImpl.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation

class CouponsRepositoryImpl: CouponsRepository {
    let couponsDataSource: CouponsDataSource
    
    init(couponsDataSource: CouponsDataSource) {
        self.couponsDataSource = couponsDataSource
    }
    
    func getAllCoupons(completionHandler: @escaping (Result<[DiscountEntity], any Error>) -> Void) {
        couponsDataSource.getAllCoupons(completionHandler: completionHandler)
    }
    func createCoupon(coupon : CouponEntity , completionHandler: @escaping (Result<Bool,Error>) -> Void){
        couponsDataSource.createCoupon(coupon: coupon, completionHandler: completionHandler)
    }
}

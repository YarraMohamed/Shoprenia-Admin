//
//  CopounsRepositoryImpl.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation
import Shopify
class CouponsRepositoryImpl: CouponsRepository {
    let couponsDataSource: CouponsDataSource
    
    init(couponsDataSource: CouponsDataSource) {
        self.couponsDataSource = couponsDataSource
    }
    
    func getAllCoupons(completionHandler: @escaping (Result<[DiscountEntity], any Error>) -> Void) {
        couponsDataSource.getAllCoupons(completionHandler: completionHandler)
    }
    func createPercentageDiscountCode(coupon : CouponEntity , completionHandler: @escaping (Result<Bool,Error>) -> Void){
        couponsDataSource.createPercentageDiscountCode(coupon: coupon, completionHandler: completionHandler)
    }
    
    func createFixedDiscountCode(coupon : CouponEntity, completionHandler: @escaping (Result<Bool,Error>)->Void){
        couponsDataSource.createFixedDiscountCode(coupon: coupon, completionHandler: completionHandler)
    }
    
    func deleteDiscountCodeById(id: ID, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        couponsDataSource.deleteDiscountCodeById(id: id, completionHandler: completionHandler)
    }
}

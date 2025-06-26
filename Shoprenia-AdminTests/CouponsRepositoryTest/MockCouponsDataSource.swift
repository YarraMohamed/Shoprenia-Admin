//
//  MockCopounsDataSource.swift
//  Shoprenia-AdminTests
//
//  Created by Abdullah Raed on 25/06/2025.
//

import Foundation
@testable import Shoprenia_Admin
import Shopify


class MockCouponsDataSource : CouponsDataSource{
    func getAllCoupons(completionHandler: @escaping (Result<[Shoprenia_Admin.DiscountEntity], any Error>) -> Void) {
        completionHandler(.success([DiscountEntity(),DiscountEntity()]))
    }
    
    func createPercentageDiscountCode(coupon: Shoprenia_Admin.CouponEntity, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        completionHandler(.success(true))
    }
    
    func createFixedDiscountCode(coupon: Shoprenia_Admin.CouponEntity, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        completionHandler(.success(true))
    }
    
    func deleteDiscountCodeById(id: Shopify.ID, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        completionHandler(.success(true))
    }
    
    
}

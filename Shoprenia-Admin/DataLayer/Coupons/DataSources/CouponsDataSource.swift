//
//  CopounsDataSource.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation
import Shopify

protocol CouponsDataSource{
    func getAllCoupons(completionHandler : @escaping (Result<[DiscountEntity],Error>)->Void)
    func createPercentageDiscountCode(coupon : CouponEntity, completionHandler: @escaping (Result<Bool,Error>)->Void)
    func createFixedDiscountCode(coupon : CouponEntity, completionHandler: @escaping (Result<Bool,Error>)->Void)
    func deleteDiscountCodeById(id : ID , completionHandler : @escaping (Result<Bool,Error>)->Void)
}

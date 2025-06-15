//
//  CopounsDataSource.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation

protocol CouponsDataSource{
    func getAllCoupons(completionHandler : @escaping (Result<[DiscountEntity],Error>)->Void)
    func createCoupon(coupon : CouponEntity, completionHandler: @escaping (Result<Bool,Error>)->Void)
}

//
//  CreateFixedDiscountUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 15/06/2025.
//

import Foundation

protocol CreateFixedDiscountUsecase{
    
    func execute(coupon : CouponEntity, completionHandler: @escaping (Result<Bool,Error>)->Void)

}


//
//  CopounsRepository.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation

protocol CouponsRepository{
    func getAllCoupons(completionHandler: @escaping (Result<[DiscountEntity],Error>) -> Void)
}

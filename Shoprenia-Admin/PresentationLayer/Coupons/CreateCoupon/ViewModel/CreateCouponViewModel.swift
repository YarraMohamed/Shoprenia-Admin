//
//  CreateCouponViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation

class CreateCouponViewModel : ObservableObject{
    
    let createPercentageDiscountCodeUsecase : CreatePercentageDiscountCodeUsecase
    let createFixedDiscountCodeUsecase : CreateFixedDiscountUsecase
    
    init(createPercentageDiscountCodeUsecase: CreatePercentageDiscountCodeUsecase, createFixedDiscountCodeUsecase: CreateFixedDiscountUsecase) {
        self.createPercentageDiscountCodeUsecase = createPercentageDiscountCodeUsecase
        self.createFixedDiscountCodeUsecase = createFixedDiscountCodeUsecase
    }
    
    func createPercentageDiscountCode(coupon : CouponEntity){
        createPercentageDiscountCodeUsecase.execute(coupon: coupon) { result in
            switch result{
                case .success(_):
                print("Coupon Created Successfully")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func createFixedDiscountCode(coupon : CouponEntity){
        createFixedDiscountCodeUsecase.execute(coupon: coupon) { result in
            switch result{
                case .success(_):
                print("Coupon Created Successfully")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

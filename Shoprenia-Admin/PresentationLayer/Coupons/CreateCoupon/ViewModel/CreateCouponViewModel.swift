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
    @Published var isLoading : Bool = false
    init(createPercentageDiscountCodeUsecase: CreatePercentageDiscountCodeUsecase, createFixedDiscountCodeUsecase: CreateFixedDiscountUsecase) {
        self.createPercentageDiscountCodeUsecase = createPercentageDiscountCodeUsecase
        self.createFixedDiscountCodeUsecase = createFixedDiscountCodeUsecase
    }
    
    func createPercentageDiscountCode(coupon : CouponEntity){
        isLoading = true
        createPercentageDiscountCodeUsecase.execute(coupon: coupon) { result in
            switch result{
                case .success(_):
                print("Coupon Created Successfully")
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        }
    }
    
    func createFixedDiscountCode(coupon : CouponEntity){
        isLoading = true
        createFixedDiscountCodeUsecase.execute(coupon: coupon) { result in
            switch result{
                case .success(_):
                print("Coupon Created Successfully")
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        }
    }
}

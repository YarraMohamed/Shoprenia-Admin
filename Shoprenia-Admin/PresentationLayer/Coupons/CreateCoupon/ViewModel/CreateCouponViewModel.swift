//
//  CreateCouponViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation

class CreateCouponViewModel : ObservableObject{
    
    let createCouponUseCase : CreateCouponUsecase
    
    init(createCouponUseCase: CreateCouponUsecase) {
        self.createCouponUseCase = createCouponUseCase
    }
    
    func createCoupon(coupon : CouponEntity){
        createCouponUseCase.execute(coupon: coupon) { result in
            switch result{
                case .success(_):
                print("Coupon Created Successfully")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

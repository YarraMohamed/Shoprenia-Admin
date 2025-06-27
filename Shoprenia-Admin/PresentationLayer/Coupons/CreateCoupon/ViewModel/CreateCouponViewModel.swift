//
//  CreateCouponViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation
import SwiftUI

class CreateCouponViewModel : ObservableObject{
    
    let createPercentageDiscountCodeUsecase : CreatePercentageDiscountCodeUsecase
    let createFixedDiscountCodeUsecase : CreateFixedDiscountUsecase
    @Published var isLoading : Bool = false
    @Published var showMessage : Bool = false
    @Published var message : String = ""
    @Published var color : Color = .green
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
                self.color = .green
                self.showMessage = true
                self.message = "Coupon Created Successfully"
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
                self.color = .red
                self.showMessage = true
                self.message = error.localizedDescription
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
                self.color = .green
                self.showMessage = true
                self.message = "Coupon Created Successfully"
            case .failure(let error):
                print(error.localizedDescription)
                self.color = .red
                self.isLoading = false
                self.showMessage = true
                self.message = error.localizedDescription
            }
        }
    }
}

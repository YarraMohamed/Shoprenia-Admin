//
//  AllCouponsViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation

class AllCouponsViewModel: ObservableObject {
    
   @Published var coupons : [DiscountEntity] = []
    let fetchAllCouponsUseCase : FetchAllCouponsUsecase
    
    init(fetchAllCouponsUseCase: FetchAllCouponsUsecase) {
        self.fetchAllCouponsUseCase = fetchAllCouponsUseCase
    }
    
    func fetchAllCoupons(){
        fetchAllCouponsUseCase.execute { [weak self] result in
            switch result {
            case .success(let coupons):
                self?.coupons = coupons
                print("Successfully fetched coupons : \(coupons)")
            case .failure(let error):
                print("Error : \(error)")
            }
        }
    }
    
}

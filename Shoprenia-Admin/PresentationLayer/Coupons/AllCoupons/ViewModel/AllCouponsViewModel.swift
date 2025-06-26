//
//  AllCouponsViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation
import Shopify

class AllCouponsViewModel: ObservableObject {
    
   @Published var coupons : [DiscountEntity] = []
    let fetchAllCouponsUseCase : FetchAllCouponsUsecase
    let deleteDiscountCodeUseCase : DeleteDiscountCodeUsecase
    init(fetchAllCouponsUseCase: FetchAllCouponsUsecase , deleteDiscountCodeUseCase : DeleteDiscountCodeUsecase) {
        self.fetchAllCouponsUseCase = fetchAllCouponsUseCase
        self.deleteDiscountCodeUseCase = deleteDiscountCodeUseCase
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
    func deleteDiscountCodeById(id : ID){
        deleteDiscountCodeUseCase.execute(id: id) { result in
            switch result {
            case .success( _):
                print("Deletion Success")
                self.coupons.removeAll(where: {$0.id == id})
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}

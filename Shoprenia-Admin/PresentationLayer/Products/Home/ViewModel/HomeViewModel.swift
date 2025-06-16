//
//  HomeViewModle.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import Foundation
import Shopify

class HomeViewModel : ObservableObject {
    
    let usecase : FetchAllVendorsUsecase
    
    @Published var vendors : [VendorEntity] = []
    
    func getAllVendors() {
        usecase.execute { [weak self ] result in
                switch result {
                case .success(let vendors):
                    self?.vendors = vendors
                case .failure(let error):
                    print("Error is : \(error.localizedDescription)")
                }
        }
        
    }
    
    init(usecase: FetchAllVendorsUsecase) {
        self.usecase = usecase
    }
    
}

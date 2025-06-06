//
//  HomeViewModle.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import Foundation
import Shopify

class HomeViewModel : ObservableObject {
    
    let usecase : FetchVendorsUsecaseProtocol
    
    @Published var vendors : [GetAllVendorsQuery.Data.Collections.Node] = []
    
    func getAllVendors() {
        usecase.excute { [weak self ] result in
                switch result {
                case .success(let vendors):
                    self?.vendors = vendors
                case .failure(let error):
                    print("Error is : \(error.localizedDescription)")
                }
        }
        
    }
    
    init(usecase: FetchVendorsUsecaseProtocol) {
        self.usecase = usecase
    }
    
}

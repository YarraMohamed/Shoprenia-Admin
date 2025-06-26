//
//  ProductDetailsViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 03/06/2025.
//

import Foundation
import Shopify

class ProductDetailsViewModel : ObservableObject {
    
    let usecase : GetProductByIdUsecase
    @Published var product : ProductEntity? = nil
    
    func getProductById(id: ID) {
        usecase.execute(id: id) { [weak self] result in
            switch result {
            case .success(let product) :
                self?.product = product
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    init(usecase: GetProductByIdUsecase) {
        self.usecase = usecase
    }
    
}

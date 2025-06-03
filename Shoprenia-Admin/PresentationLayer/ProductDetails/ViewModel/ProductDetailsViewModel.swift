//
//  ProductDetailsViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 03/06/2025.
//

import Foundation
import Shopify

class ProductDetailsViewModel: ProductDetailsViewModelProtocol , ObservableObject {
    
    let usecase : GetProductByIdUsecaseProtocol
    @Published var product : GetProductByIDQuery.Data.Product? = nil
    
    func getProductById(id: ID) {
        usecase.excute(id: id) { [weak self] result in
            switch result {
            case .success(let product) :
                self?.product = product
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    init(usecase: GetProductByIdUsecaseProtocol) {
        self.usecase = usecase
    }
    
}

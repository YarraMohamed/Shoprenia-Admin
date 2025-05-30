//
//  AllProductsViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import Foundation
import Shopify

class AllProductsViewModel: AllProductsViewModelProtocol , ObservableObject {
    
    let usecase : FetchProductsUsecaseProtocol
    @Published var products : [GetProductsQuery.Data.Products.Node] = []
    
    func fetchAllProducts(){
        usecase.excute { [weak self] result in
            switch result{
            case .success(let products):
                self?.products = products
            case .failure(let error):
                print("Error is : \(error.localizedDescription)")
            }
        }
    }
    
    init(usecase: FetchProductsUsecaseProtocol){
        self.usecase = usecase
    }
}

//
//  AllProductsViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import Foundation
import Shopify

class AllProductsViewModel : ObservableObject {
    
    let usecase : FetchProductsUsecaseProtocol
    let deleteProductUsecase : DeleteProductUsecase
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
    
    func deleteProductByID(productID : ID){
        deleteProductUsecase.execute(productID : productID) { result in
            switch result {
            case .success(_):
                print("Deletion Success")
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    init(usecase: FetchProductsUsecaseProtocol, deleteProductUsecase: DeleteProductUsecase){
        self.usecase = usecase
        self.deleteProductUsecase = deleteProductUsecase
    }
}

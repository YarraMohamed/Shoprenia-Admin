//
//  AllProductsViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import Foundation
import Shopify

class AllProductsViewModel : ObservableObject {
    
    let fetchProductsUsecase : FetchProductsUsecase
    let deleteProductUsecase : DeleteProductUsecase
    let getVendorProductsUsecase : VendorProductsUsecase
    @Published var products : [ProductEntity] = []
    
    func fetchAllProducts(){
        fetchProductsUsecase.execute { result in
            switch result {
            case .success(let products):
                self.products = products
                print("All Products are fetched")
            case .failure(let failure):
                print(failure.localizedDescription)
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
    
    func getVendorProducts(vendorName : String){
        getVendorProductsUsecase.execute(vendorName: vendorName) { result in
            switch result {
            case .success(let products):
                self.products = products
                print("All Vendor Products are fetched")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    init(usecase: FetchProductsUsecase, deleteProductUsecase: DeleteProductUsecase, getVendorProductsUsecase : VendorProductsUsecase){
        self.fetchProductsUsecase = usecase
        self.deleteProductUsecase = deleteProductUsecase
        self.getVendorProductsUsecase = getVendorProductsUsecase
    }
}

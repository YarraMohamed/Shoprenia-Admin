//
//  AllProductsViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import Foundation
import Shopify
import SwiftUI
import Combine

class AllProductsViewModel : ObservableObject {
    
    let fetchProductsUsecase : FetchProductsUsecase
    let deleteProductUsecase : DeleteProductUsecase
    let getVendorProductsUsecase : VendorProductsUsecase
    @Published var products : [ProductEntity] = []
    @Published var filteredProducts : [ProductEntity] = []
    @Published var searchText : String = ""
    private var cancellables : Set<AnyCancellable> = []
    
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
    
    func addSubscribers(){
        $searchText
            .combineLatest(self.$products)
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { searchText, products in
                guard !searchText.isEmpty else {
                    self.filteredProducts = products
                    return
                }
                let filteredProducts = products.filter {$0.title?.lowercased().contains(searchText.lowercased()) ?? false}
                self.filteredProducts = filteredProducts
            }.store(in: &cancellables)
    }
}

//
//  Shoprenia_AdminApp.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 27/05/2025.
//

import SwiftUI

@main
struct Shoprenia_AdminApp: App {
    
    @StateObject var addProductViewModel = {
        let productsRemoteDataSource = ProductRemoteDataSourceImpl(networkService: NetworkServiceImpl.shared)
        let productsRepository = ProductRepositoryImpl(productRemoteDataSource: productsRemoteDataSource)
        let createProductUseCase = CreateProductUsecaseImpl(repository: productsRepository)
        let createProductOptionsUseCase = CreateProductOptionsUsecaseImpl(repository: productsRepository)
        let createProductVariantUseCase = CreateProductVariantsUsecaseImpl(repository: productsRepository)
        let updateProductVariantUsecase = UpdateProductVariantUsecaseImpl(repository: productsRepository)
        let setInventoryQuantityUseCase: SetInventoryQuantityUsecase = SetInventoryQuantityUsecaseImpl(repository: productsRepository)
        return AddProductViewModel(createProductUseCase: createProductUseCase, createProductOptionsUseCase: createProductOptionsUseCase, createProductVariantUseCase: createProductVariantUseCase, updateProductVariantUsecase: updateProductVariantUsecase, setInventoryQuantityUseCase: setInventoryQuantityUseCase, publishProductUsecase: PublishProductUsecaseImpl(repository: productsRepository))
    }()
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(named: "shopreniaBlue") ?? ""]
    }
    var body: some Scene {
        WindowGroup {
            AuthenticationScreen()
                .environmentObject(addProductViewModel)
        }
    }
}

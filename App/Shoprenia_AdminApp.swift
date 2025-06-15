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
    @StateObject var updateProductViewModel = {
        let productsRemoteDataSource = ProductRemoteDataSourceImpl(networkService: NetworkServiceImpl.shared)
        let productsRepository = ProductRepositoryImpl(productRemoteDataSource: productsRemoteDataSource)
        let createProductUseCase = CreateProductUsecaseImpl(repository: productsRepository)
        let createProductOptionsUseCase = CreateProductOptionsUsecaseImpl(repository: productsRepository)
        let createProductVariantUseCase = CreateProductVariantsUsecaseImpl(repository: productsRepository)
        let updateProductVariantUsecase = UpdateProductVariantUsecaseImpl(repository: productsRepository)
        let setInventoryQuantityUseCase: SetInventoryQuantityUsecase = SetInventoryQuantityUsecaseImpl(repository: productsRepository)
        return UpdateProductViewModel(deleteProductUseCase: DeleteProductUsecaseImpl(repository: productsRepository), createProductUseCase: createProductUseCase, createProductOptionsUseCase: createProductOptionsUseCase, createProductVariantUseCase: createProductVariantUseCase, updateProductVariantUsecase: updateProductVariantUsecase, setInventoryquantityUseCase: setInventoryQuantityUseCase, publishProductUsecase: PublishProductUsecaseImpl(repository: productsRepository))
    }()
    
    @StateObject var allCouponsViewModel = {
        let couponsDataSource = CouponsDataSourceImpl(networkService: NetworkServiceImpl.shared)
        let couponsRepository = CouponsRepositoryImpl(couponsDataSource: couponsDataSource)
        let fetchAllCouponsUsecase = FetchAllCouponsUsecaseImpl(repository: couponsRepository)
        let deleteDiscountCodeUseCase = DeleteDiscountCodeUsecaseImpl(repository: couponsRepository)
        return AllCouponsViewModel(fetchAllCouponsUseCase: fetchAllCouponsUsecase, deleteDiscountCodeUseCase: deleteDiscountCodeUseCase)
    }()
    
    @StateObject var createCouponsViewModel = {
        let couponsDataSource = CouponsDataSourceImpl(networkService: NetworkServiceImpl.shared)
        let couponsRepository = CouponsRepositoryImpl(couponsDataSource: couponsDataSource)
        let createCouponUsecase = CreatePercentageDiscountCodeUsecaseImpl(repository: couponsRepository)
        let createFixedCode = CreateFixedDiscountUsecaseImpl(repository: couponsRepository)
        return CreateCouponViewModel(createPercentageDiscountCodeUsecase: createCouponUsecase, createFixedDiscountCodeUsecase: createFixedCode)
    }()
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(named: "shopreniaBlue") ?? ""]
    }
    var body: some Scene {
        WindowGroup {
            AuthenticationScreen()
                .environmentObject(addProductViewModel)
                .environmentObject(updateProductViewModel)
                .environmentObject(allCouponsViewModel)
                .environmentObject(createCouponsViewModel)
        }
    }
}

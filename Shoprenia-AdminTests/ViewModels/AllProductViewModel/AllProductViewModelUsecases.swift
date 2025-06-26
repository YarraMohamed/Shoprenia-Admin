//
//  AllProductViewModelUsecases.swift
//  Shoprenia-AdminTests
//
//  Created by Abdullah Raed on 26/06/2025.
//

import Foundation
@testable import Shoprenia_Admin
import Shopify


class MockDeleteProductUsecase : DeleteProductUsecase {
    
    func execute(productID: Shopify.ID, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        completionHandler(.success(true))
    }
}

class MockFetchProductsUsecase : FetchProductsUsecase{
    func execute(completionHandler: @escaping (Result<[Shoprenia_Admin.ProductEntity], any Error>) -> Void) {
        completionHandler(.success([ProductEntity(),ProductEntity(),ProductEntity()]))
    }
    
}

class MockVendorProductsUsecase : VendorProductsUsecase{
    func execute(vendorName: String, completionHndeler: @escaping (Result<[Shoprenia_Admin.ProductEntity], any Error>) -> Void) {
        completionHndeler(.success([ProductEntity(vendor:vendorName),ProductEntity(vendor:vendorName),ProductEntity(vendor:vendorName)]))
    }
    
}

//
//  ProductRepositoryImpl.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 09/06/2025.
//

import Foundation
import Shopify

class ProductRepositoryImpl: ProductRepository {
    
    private let productRemoteDataSource : ProductRemoteDataSource
    
    init(productRemoteDataSource: ProductRemoteDataSource) {
        self.productRemoteDataSource = productRemoteDataSource
    }
    
    func getProductById(productID: ID, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        productRemoteDataSource.getProductById(productID: productID, completionHandler: completionHandler)
    }
    
    func createProduct(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        productRemoteDataSource.createProduct(product: product, completionHandler: completionHandler)
    }
    
    func createProductOptions(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        productRemoteDataSource.createProductOptions(product: product, completionHandler: completionHandler)
    }
    
    func updateProductVariant(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        productRemoteDataSource.updateProductVariant(product: product, completionHandler: completionHandler)
    }
    
    func setInventory(inventory: InventoryEntity, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        productRemoteDataSource.setInventory(inventory: inventory, completionHandler: completionHandler)
    }
    
    func createProductVariants(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void) {
        productRemoteDataSource.createProductVariants(product: product, completionHandler: completionHandler)
    }
    
    func publishProduct(productID: ID, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        productRemoteDataSource.publishProduct(productID: productID, completionhandler: completionHandler)
    }
    
    func deleteProduct(productID: ID, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        productRemoteDataSource.deleteProduct(productID: productID, completionhandler: completionHandler)
    }
    
    func getVendorProducts(vendorName: String, completionHandler: @escaping (Result<[ProductEntity], any Error>) -> Void) {
        productRemoteDataSource.getVendorProducts(vendorName: vendorName, completionHandler: completionHandler)
    }
    
    func getAllProducts(completionHandler: @escaping (Result<[ProductEntity], any Error>) -> Void) {
        productRemoteDataSource.getAllProducts(completionHandler: completionHandler)
    }
    
    func getAllVendors(completionHandler: @escaping (Result<[VendorEntity], any Error>) -> Void) {
        productRemoteDataSource.getAllVendors(completionhandler: completionHandler)
    }
}

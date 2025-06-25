//
//  MockProductDataSource.swift
//  Shoprenia-AdminTests
//
//  Created by Abdullah Raed on 25/06/2025.
//

import Foundation
@testable import Shoprenia_Admin
import Shopify

final class MockProductDataSource : ProductRemoteDataSource{
    func getAllProducts(completionHandler: @escaping (Result<[Shoprenia_Admin.ProductEntity], any Error>) -> Void) {
        completionHandler(.success([ProductEntity(),ProductEntity(),ProductEntity()]))
    }
    
    func getAllVendors(completionhandler: @escaping (Result<[Shoprenia_Admin.VendorEntity], any Error>) -> Void) {
        completionhandler(.success([VendorEntity(),VendorEntity(),VendorEntity()]))
    }
    
    func getVendorProducts(vendorName: String, completionHandler: @escaping (Result<[Shoprenia_Admin.ProductEntity], any Error>) -> Void) {
        completionHandler(.success([ProductEntity(vendor:vendorName),ProductEntity(vendor:vendorName),ProductEntity(vendor:vendorName)]))
    }
    
    func getProductById(productID: Shopify.ID, completionHandler: @escaping (Result<Shoprenia_Admin.ProductEntity, any Error>) -> Void) {
        completionHandler(.success(ProductEntity(id: productID)))
    }
    
    func createProduct(product: Shoprenia_Admin.ProductEntity, completionHandler: @escaping (Result<Shoprenia_Admin.ProductEntity, any Error>) -> Void) {
        completionHandler(.success(ProductEntity(id: product.id)))
    }
    
    func createProductOptions(product: Shoprenia_Admin.ProductEntity, completionHandler: @escaping (Result<Shoprenia_Admin.ProductEntity, any Error>) -> Void) {
        completionHandler(.success(ProductEntity(options: product.options)))
    }
    
    func updateProductVariant(product: Shoprenia_Admin.ProductEntity, completionHandler: @escaping (Result<Shoprenia_Admin.ProductEntity, any Error>) -> Void) {
        completionHandler(.success(ProductEntity(variants: product.variants)))
    }
    
    func setInventory(inventory: Shoprenia_Admin.InventoryEntity, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        completionHandler(.success(true))
    }
    
    func createProductVariants(product: Shoprenia_Admin.ProductEntity, completionHandler: @escaping (Result<Shoprenia_Admin.ProductEntity, any Error>) -> Void) {
        completionHandler(.success(ProductEntity(variants: product.variants)))
    }
    
    func publishProduct(productID: Shopify.ID, completionhandler: @escaping (Result<Bool, any Error>) -> Void) {
        completionhandler(.success(true))
    }
    
    func deleteProduct(productID: Shopify.ID, completionhandler: @escaping (Result<Bool, any Error>) -> Void) {
        completionhandler(.success(true))
    }
    
    
}

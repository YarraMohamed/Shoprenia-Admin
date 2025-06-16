//
//  ProductRepository.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 09/06/2025.
//

import Foundation
import Shopify

protocol ProductRepository{
    func getAllProducts(completionHandler : @escaping (Result<[ProductEntity],Error>)->Void)
    func getAllVendors(completionHandler : @escaping (Result<[VendorEntity],Error>)->Void)
    func getVendorProducts(vendorName : String , completionHandler : @escaping (Result<[ProductEntity],Error>)->Void)
    func getProductById(productID : ID , completionHandler : @escaping (Result<ProductEntity,Error>)->Void)
    func createProduct(product : ProductEntity , completionHandler : @escaping (Result<ProductEntity,Error>)->Void)
    func createProductOptions(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void)
    func updateProductVariant(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void)
    func setInventory(inventory : InventoryEntity , completionHandler : @escaping (Result<Bool,Error>)->Void)
    func createProductVariants(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void)
    func publishProduct(productID : ID , completionHandler : @escaping (Result<Bool,Error>)->Void)
    func deleteProduct(productID : ID , completionHandler : @escaping (Result<Bool,Error>)->Void)
}

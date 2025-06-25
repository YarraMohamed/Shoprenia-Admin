//
//  ProductRepositoryTest.swift
//  Shoprenia-AdminTests
//
//  Created by Abdullah Raed on 25/06/2025.
//

import XCTest
@testable import Shoprenia_Admin
import Shopify

final class ProductRepositoryTest: XCTestCase {

    var repository: ProductRepository!
    
    override func setUpWithError() throws {
       repository = ProductRepositoryImpl(productRemoteDataSource: MockProductDataSource())
    }

    override func tearDownWithError() throws {
        repository = nil
    }

    func testGetAllProducts(){
        repository.getAllProducts { result in
            switch result {
            case .success(let products):
                XCTAssertTrue(products.count>0)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
   
    func testGetAllVendors(){
        repository.getAllVendors { result in
            switch result {
            case .success(let vendors):
                XCTAssertTrue(vendors.count>0)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }

    func testGetVendorProducts(){
        repository.getVendorProducts(vendorName: "vendor") { result in
            switch result {
            case .success(let products):
                XCTAssertTrue(products.count>0)
                XCTAssertEqual(products.first?.vendor, "vendor")
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testGetProductById(){
        repository.getProductById(productID: "id") { result in
            switch result {
            case .success(let product):
                XCTAssertTrue(product.id == "id")
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testCreateProduct(){
        repository.createProduct(product: ProductEntity(id:"id")) { result in
            switch result {
            case .success(let product):
                XCTAssertTrue(product.id == "id")
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testCreateProductOptions(){
        let options = [OptionEntity(),OptionEntity()]
        repository.createProductOptions(product: ProductEntity( options: options)) { result in
            switch result {
            case .success(let product):
                XCTAssertTrue(product.options?.count == options.count)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testUpdateProductVariants(){
        let variants = [VariantEntity(),VariantEntity()]
        repository.updateProductVariant(product: ProductEntity(variants: variants)) { result in
            switch result {
            case .success(let product):
                XCTAssertTrue(product.variants?.count == variants.count)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testSetInventory(){
        repository.setInventory(inventory: InventoryEntity()) { result in
            switch result {
            case .success(let success):
                XCTAssertTrue(success)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testCreateProductVariants(){
        let variants = [VariantEntity(),VariantEntity()]
        repository.createProductVariants(product: ProductEntity(variants : variants)) { result in
            switch result {
            case .success(let product):
                XCTAssertTrue(product.variants?.count == variants.count)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testPublishProduct(){
        repository.publishProduct(productID: "id") { result in
            switch result {
            case .success(let success):
                XCTAssertTrue(success)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testDeleteProduct(){
        repository.deleteProduct(productID: "id") { result in
            switch result {
            case .success(let success):
                XCTAssertTrue(success)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
}

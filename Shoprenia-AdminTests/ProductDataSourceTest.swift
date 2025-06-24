//
//  Shoprenia_AdminTests.swift
//  Shoprenia-AdminTests
//
//  Created by Abdullah Raed on 20/06/2025.
//

import XCTest
@testable import Shoprenia_Admin
import Shopify

final class ProductDataSourceTest : XCTestCase {

    var  productDataSource : ProductRemoteDataSource!
    var productID : ID!
    override func setUpWithError() throws {
        productDataSource = ProductRemoteDataSourceImpl(networkService: MockNetworkService())
    }

    override func tearDownWithError() throws {
        productDataSource = nil
    }
    
    func testGetAllProducts(){
        let expectation = expectation(description: "Awaiting response..")
        productDataSource.getAllProducts { result in
            switch result {
            case .success(let products):
                if products.count > 0 {
                    XCTAssertTrue(true)
                    expectation.fulfill()
                }else {
                    XCTFail("No Products Found")
                }
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    
    func testGetAllVendors(){
        let expectation = expectation(description: "Awaiting response..")
        productDataSource.getAllVendors { result in
            switch result {
            case .success(let vendors):
                if vendors.count > 0 {
                    XCTAssertTrue(true)
                    expectation.fulfill()
                }else{
                    XCTFail("No Vendors Found")
                }
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)

    }
    
    func testVendorProducts(){
        let expectation = expectation(description: "Awaiting response..")
        productDataSource.getVendorProducts(vendorName: "Adidas"){ result in
            switch result {
            case .success(let products):
                if products.count > 0 {
                    XCTAssertTrue(true)
                    expectation.fulfill()
                }else{
                    XCTFail("No Products Found")
                }
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testGetProductById(){
        let expectation = expectation(description: "Awaiting response..")
        productDataSource.getProductById(productID: "gid://shopify/Product/7944168505418"){ result in
            switch result {
            case .success(let product):
                if product.title != nil {
                    XCTAssertTrue(true)
                    expectation.fulfill()
                }else{
                    XCTFail("No product Found")
                }
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    
    func testCreateProduct(){
        productDataSource.createProduct(product: ProductEntity(title: "title", descriptionHTML: "desc",  vendor: "vendor", productType: "type")){ result in
            switch result {
            case .success(let product):
                if product.title != "" {
                    XCTAssertTrue(true)
                    print("in Success : \(product.title)")
                }else{
                    XCTFail("No product created")
                }
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testCreateProductOptions(){
        productDataSource.createProductOptions(product: ProductEntity(
            id: "gid://shopify/ProductVariant/42206655479882",
            options: [OptionEntity(
                name: "color",
                optionValues: [OptionValueEntity(name: "red")]
                
            )]
        )){ result in
            switch result {
            case .success(let option):
                if option.id != "" {
                    XCTAssertTrue(true)
                }else{
                    XCTFail("No option created")
                }
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testCreateProductVariant(){
        productDataSource.createProductVariants(product: ProductEntity(
            id: "gid://shopify/ProductVariant/42206655479882",
            options: [OptionEntity(
                name: "color",
                optionValues: [OptionValueEntity(name: "red")]
                
            )]
        )){ result in
            switch result {
            case .success(let option):
                if option.id != "" {
                    XCTAssertTrue(true)
                }else{
                    XCTFail("No option created")
                }
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testPublishProduct(){
        productDataSource.publishProduct(productID: "id"){ result in
            switch result {
            case .success(let result):
                XCTAssertTrue(result)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testUpdateProductVariant(){
        productDataSource.updateProductVariant(product:ProductEntity(
            id: "gid://shopify/ProductVariant/42206655479882",
            options: [OptionEntity(
                name: "color",
                optionValues: [OptionValueEntity(name: "red")]
                
            )]
        ) ){ result in
            switch result {
            case .success(let product):
                if product.title != "" {
                    XCTAssertTrue(true)
                }else{
                    XCTFail("No product created")
                }
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testSetInventory(){
        productDataSource.setInventory(inventory: InventoryEntity()){ result in
            switch result {
            case .success(let result):
                XCTAssertTrue(result)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testDeleteProductById(){
        productDataSource.deleteProduct(productID: "id") { result in
            switch result {
            case .success(let result):
                XCTAssertTrue(result)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    
}

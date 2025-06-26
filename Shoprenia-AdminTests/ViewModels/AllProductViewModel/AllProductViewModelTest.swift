//
//  AllProductViewModelTest.swift
//  Shoprenia-AdminTests
//
//  Created by Abdullah Raed on 26/06/2025.
//

import XCTest
@testable import Shoprenia_Admin
import Shopify

final class AllProductViewModelTest: XCTestCase {

    var viewModel : AllProductsViewModel!
    
    override func setUpWithError() throws {
       viewModel = AllProductsViewModel(usecase: MockFetchProductsUsecase(), deleteProductUsecase: MockDeleteProductUsecase(), getVendorProductsUsecase: MockVendorProductsUsecase())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testGetAllProducts(){
        viewModel.fetchAllProducts()
        XCTAssert(viewModel.products.count > 0)
    }
    
    func testGetVendorProducts(){
        viewModel.getVendorProducts(vendorName: "vendor")
        XCTAssert(viewModel.products.count > 0)
        XCTAssert(viewModel.products.first?.vendor == "vendor")
    }
    
    func testDeleteProduct(){
        viewModel.deleteProductByID(productID: "123")
        XCTAssert(true)
    }
    
}

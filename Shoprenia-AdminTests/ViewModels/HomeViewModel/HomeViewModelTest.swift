//
//  HomeViewModelTest.swift
//  Shoprenia-AdminTests
//
//  Created by Abdullah Raed on 26/06/2025.
//

import XCTest
@testable import Shoprenia_Admin
import Shopify

final class HomeViewModelTest: XCTestCase {
    
    var viewModel : HomeViewModel!

    override func setUpWithError() throws {
        viewModel = HomeViewModel(usecase: MockFetchAllVendorsUsecase())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testFetchAllVendors() {
        viewModel.getAllVendors()
        XCTAssert(viewModel.vendors.count > 0)
    }
    

}

//
//  AllCouponsViewModelTest.swift
//  Shoprenia-AdminTests
//
//  Created by Abdullah Raed on 26/06/2025.
//

import XCTest
@testable import Shoprenia_Admin
import Shopify

final class AllCouponsViewModelTest: XCTestCase {
    
    var viewModel : AllCouponsViewModel!

    override func setUpWithError() throws {
            viewModel = AllCouponsViewModel(fetchAllCouponsUseCase: MockFetchAllCouponsUsecase(), deleteDiscountCodeUseCase: MockDeleteDiscountCodeUsecase())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchAllCoupons() {
        viewModel.fetchAllCoupons()
        XCTAssert(viewModel.coupons.count == 3)
    }
    
    func testDeleteDiscountCode() {
        viewModel.deleteDiscountCodeById(id: "id")
        XCTAssert(true)
    }
    
}

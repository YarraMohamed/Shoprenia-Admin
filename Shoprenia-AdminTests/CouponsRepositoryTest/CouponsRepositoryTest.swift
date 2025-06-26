//
//  CouponsRepositoryTest.swift
//  Shoprenia-AdminTests
//
//  Created by Abdullah Raed on 25/06/2025.
//

import XCTest
@testable import Shoprenia_Admin
import Shopify

final class CouponsRepositoryTest: XCTestCase {

    var repository : CouponsRepository!
    
    override func setUpWithError() throws {
        repository = CouponsRepositoryImpl(couponsDataSource: MockCouponsDataSource())
    }

    override func tearDownWithError() throws {
        repository = nil
    }

    func testGetAllCoupons(){
        repository.getAllCoupons { result in
            switch result{
                case .success(let coupons):
                XCTAssertTrue(coupons.count > 0)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    func testCreatePercentageDiscountCode(){
        repository.createPercentageDiscountCode(coupon: CouponEntity()) { result in
            switch result {
            case .success(let success):
                XCTAssertTrue(success)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
   
    func testCreateFixedDiscountCode(){
        repository.createFixedDiscountCode(coupon: CouponEntity()) { result in
            switch result {
            case .success(let success):
                XCTAssertTrue(success)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
    func testDeleteDiscountCodeById(){
        repository.deleteDiscountCodeById(id:"ID") { result in
            switch result {
            case .success(let success):
                XCTAssertTrue(success)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }
    
}

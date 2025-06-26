//
//  MockAllCouponsViewModelUsecases.swift
//  Shoprenia-AdminTests
//
//  Created by Abdullah Raed on 26/06/2025.
//

import Foundation
@testable import Shoprenia_Admin
import Shopify

class MockFetchAllCouponsUsecase : FetchAllCouponsUsecase{
    
    func execute(completionHandler: @escaping (Result<[Shoprenia_Admin.DiscountEntity], any Error>) -> Void) {
        completionHandler(.success([DiscountEntity(),DiscountEntity(),DiscountEntity()]))
    }
}

class MockDeleteDiscountCodeUsecase : DeleteDiscountCodeUsecase{
    
    func execute(id: Shopify.ID, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        completionHandler(.success(true))
    }
}

//
//  MockHomeViewModelUsecases.swift
//  Shoprenia-AdminTests
//
//  Created by Abdullah Raed on 26/06/2025.
//

import Foundation
@testable import Shoprenia_Admin
import Shopify

class MockFetchAllVendorsUsecase: FetchAllVendorsUsecase {
    func execute(completionHandler: @escaping (Result<[Shoprenia_Admin.VendorEntity], any Error>) -> Void) {
        completionHandler(.success([VendorEntity(),VendorEntity(),VendorEntity()]))
    }
    
}

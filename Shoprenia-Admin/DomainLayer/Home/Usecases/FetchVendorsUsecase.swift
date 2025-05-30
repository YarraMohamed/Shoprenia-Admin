//
//  FetchVendorsUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import Foundation
import Shopify

class FetchVendorsUsecase : FetchVendorsUsecaseProtocol {
    
    private let networkSercive : NetworkServiceProtocol
    
    func excute(completionHandler: @escaping (Result<[Shopify.GetAllVendorsQuery.Data.Collections.Node], any Error>) -> Void) {
        networkSercive.getAllVendors(completionHandler: completionHandler)
    }
    
    init(networkSercive: NetworkServiceProtocol) {
        self.networkSercive = networkSercive
    }
    
}

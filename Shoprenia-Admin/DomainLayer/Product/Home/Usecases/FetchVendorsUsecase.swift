//
//  FetchVendorsUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import Foundation
import Shopify

class FetchVendorsUsecase : FetchVendorsUsecaseProtocol {
    
    private let networkSercive : NetworkService
    
    func excute(completionHandler: @escaping (Result<[Shopify.GetAllVendorsQuery.Data.Collections.Node], any Error>) -> Void) {
        NetworkServiceImpl.shared.getAllVendors(completionHandler: completionHandler)
    }
    
    init(networkSercive: NetworkService) {
        self.networkSercive = networkSercive
    }
    
}

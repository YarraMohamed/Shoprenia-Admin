//
//  FetchVendorsUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import Foundation
import Shopify

protocol FetchVendorsUsecaseProtocol {
    
    func excute(completionHandler: @escaping (Result<[GetAllVendorsQuery.Data.Collections.Node], Error>) -> Void)
    
}

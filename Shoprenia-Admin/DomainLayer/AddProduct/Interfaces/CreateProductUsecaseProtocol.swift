//
//  CreateProductUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation
import Shopify

protocol CreateProductUsecaseProtocol {
    
    func excute(title: String, description: String, productType: String, vendor: String, completionHandler: @escaping (Result<Bool, any Error>) ->Void)
}


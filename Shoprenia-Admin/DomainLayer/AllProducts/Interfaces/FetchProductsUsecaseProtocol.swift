//
//  FetchProductsUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import Foundation
import Shopify

protocol FetchProductsUsecaseProtocol {
    func excute(completionHandler : @escaping (Result<[GetProductsQuery.Data.Products.Node],Error>)->Void)
}

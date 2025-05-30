//
//  NetworkServiceProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//


import Foundation
import Shopify

protocol NetworkServiceProtocol {
    func getAllVendors(completionHandler : @escaping (Result<[GetAllVendorsQuery.Data.Collections.Node],Error>)->Void)
    func getAllProducts(completionHandler : @escaping (Result<[GetProductsQuery.Data.Products.Node],Error>)->Void)
}

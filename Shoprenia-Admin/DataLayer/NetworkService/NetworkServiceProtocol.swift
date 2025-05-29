//
//  NetworkServiceProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//


import Foundation
import Shopify

protocol NetworkServiceProtocol {
    func getAllVendorsName(completionHandler : @escaping (Result<[String],Error>)->Void)
    func getAllProducts(completionHandler : @escaping (Result<[GetProductsQuery.Data.Products.Node],Error>)->Void)
}

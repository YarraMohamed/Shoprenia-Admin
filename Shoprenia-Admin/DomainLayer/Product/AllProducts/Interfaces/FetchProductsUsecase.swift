//
//  FetchProductsUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import Foundation
import Shopify

protocol FetchProductsUsecase {
    func execute(completionHandler : @escaping (Result<[ProductEntity],Error>)->Void)
}

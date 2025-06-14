//
//  CreateProductUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation
import Shopify

protocol CreateProductUsecase {
    
    func execute(product : ProductEntity, completionHandler: @escaping (Result<ProductEntity,Error>) ->Void)
}


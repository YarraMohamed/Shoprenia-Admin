//
//  CreateProductVariantsUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 07/06/2025.
//

import Foundation
import Shopify

protocol CreateProductVariantsUsecase {
    func execute(product : ProductEntity, completionHandler : @escaping (Result<ProductEntity, Error>) -> Void)
}

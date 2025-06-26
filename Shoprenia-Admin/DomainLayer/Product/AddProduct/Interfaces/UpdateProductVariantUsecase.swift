//
//  UpdateProductVariantUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 08/06/2025.
//

import Foundation
import Shopify


protocol UpdateProductVariantUsecase {
    func execute(product: ProductEntity, completionHandler: @escaping (Result<ProductEntity, any Error>) -> Void)
}

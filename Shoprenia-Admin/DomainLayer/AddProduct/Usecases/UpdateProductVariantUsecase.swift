//
//  UpdateProductVariantUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 08/06/2025.
//

import Foundation
import Shopify

class UpdateProductVariantUsecase : UpdateProductVariantUsecaseProtocol {
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    func excute(productID: ID, variants: [ProductVariantsBulkInput], completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        networkService.updateProductVariant(productID: productID, variants: variants, completionHandler: completionHandler)
    }
}

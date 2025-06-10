//
//  CreateProductVariantsUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 07/06/2025.
//

import Foundation
import Shopify

class CreateProductVariantsUsecase : CreateProductVariantsUsecaseProtocol {
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    func excute(id: ID, variants: [ProductVariantsBulkInput], completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        NetworkServiceImpl.shared.createProductVariants(id: id, variants: variants, completionHandler: completionHandler)
    }
}

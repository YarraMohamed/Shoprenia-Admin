//
//  CreateProductVariantsUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 07/06/2025.
//

import Foundation
import Shopify

protocol CreateProductVariantsUsecaseProtocol {
    func excute(id : ID, variants : [ProductVariantsBulkInput], completionHandler : @escaping (Result<Bool, Error>) -> Void)
}

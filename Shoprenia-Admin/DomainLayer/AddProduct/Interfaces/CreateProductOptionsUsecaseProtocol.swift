//
//  CreateProductOptionsUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation
import Shopify

protocol CreateProductOptionsUsecaseProtocol {
    func excute(id : ID, productOptions : [OptionCreateInput] , completionHandler : @escaping (Result<CreateProductOptionsMutation.Data.ProductOptionsCreate.Product, Error>) -> Void)
}

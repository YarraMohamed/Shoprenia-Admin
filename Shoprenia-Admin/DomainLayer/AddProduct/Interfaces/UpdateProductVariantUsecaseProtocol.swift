//
//  UpdateProductVariantUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 08/06/2025.
//

import Foundation
import Shopify


protocol UpdateProductVariantUsecaseProtocol {
    func excute(productID : ID , variants : [ProductVariantsBulkInput] , completionHandler : @escaping (Result<Bool,Error>)->Void)
}

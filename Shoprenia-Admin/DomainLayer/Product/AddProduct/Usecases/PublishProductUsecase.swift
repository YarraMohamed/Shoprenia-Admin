//
//  PublishProductUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 12/06/2025.
//

import Foundation
import Shopify


protocol PublishProductUsecase{
    func execute(productID : ID ,completionHandler : @escaping (Result<Bool,Error>) -> Void)
}

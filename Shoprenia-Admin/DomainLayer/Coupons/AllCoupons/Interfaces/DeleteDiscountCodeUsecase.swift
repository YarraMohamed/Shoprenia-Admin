//
//  DeleteDiscountCodeUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 15/06/2025.
//

import Foundation
import Shopify

protocol DeleteDiscountCodeUsecase {
    func execute(id: ID, completionHandler: @escaping (Result<Bool, Error>) -> Void)
}

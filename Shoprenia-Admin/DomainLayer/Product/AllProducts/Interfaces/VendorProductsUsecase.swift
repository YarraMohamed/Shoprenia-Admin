//
//  VendorProductsUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation


protocol VendorProductsUsecase {
    func execute(vendorName : String , completionHndeler : @escaping (Result<[ProductEntity], Error>) -> Void)
}

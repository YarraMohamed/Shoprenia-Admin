//
//  GetProductByIdUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 03/06/2025.
//

import Foundation
import Shopify

protocol GetProductByIdUsecase{
    
    func execute(id : ID,completionHandler : @escaping (Result<ProductEntity,Error>)->Void)
    
}

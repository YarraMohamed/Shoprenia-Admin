//
//  GetProductByIdUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 03/06/2025.
//

import Foundation
import Shopify

protocol GetProductByIdUsecaseProtocol{
    
    func excute(id : ID,completionHandler : @escaping (Result<GetProductByIDQuery.Data.Product,Error>)->Void)
    
}

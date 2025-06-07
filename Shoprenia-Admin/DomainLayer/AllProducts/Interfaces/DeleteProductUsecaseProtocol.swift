//
//  DeleteProductUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 07/06/2025.
//

import Foundation
import Shopify

protocol DeleteProductUsecaseProtocol{
    func excute(id : ID , completionHandler : @escaping (Result<Bool,Error>) -> Void)
}

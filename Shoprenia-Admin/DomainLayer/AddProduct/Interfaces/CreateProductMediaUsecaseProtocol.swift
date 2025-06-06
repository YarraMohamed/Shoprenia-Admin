//
//  CreateProductMediaUsecaseProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation
import Shopify

protocol CreateProductMediaUsecaseProtocol {
    
    func excute(id : ID, media: [CreateMediaInput], completionHandeler : @escaping (Result<Bool, Error>) -> Void)
    
}

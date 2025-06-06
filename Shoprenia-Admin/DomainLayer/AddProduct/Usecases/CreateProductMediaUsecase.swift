//
//  CreateProductMediaUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation
import Shopify


class CreateProductMediaUsecase : CreateProductMediaUsecaseProtocol {
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func excute(id : ID, media : [CreateMediaInput], completionHandeler: @escaping (Result<Bool, any Error>) -> Void) {
        networkService.createProductMedia(id: id, media: media, completionHandler: completionHandeler)
    }
    
}

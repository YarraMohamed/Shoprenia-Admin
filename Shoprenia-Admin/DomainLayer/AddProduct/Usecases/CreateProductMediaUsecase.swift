//
//  CreateProductMediaUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation
import Shopify


class CreateProductMediaUsecase : CreateProductMediaUsecaseProtocol {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func excute(id : ID, media : [CreateMediaInput], completionHandeler: @escaping (Result<Bool, any Error>) -> Void) {
        NetworkServiceImpl.shared.createProductMedia(id: id, media: media, completionHandler: completionHandeler)
    }
    
}

//
//  CreateProductOptionsUsecase.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation
import Shopify

class CreateProductOptionsUsecase : CreateProductOptionsUsecaseProtocol {
    
    let networkService : NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func excute(id : ID, productOptions : [OptionCreateInput], completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        networkService.createProductOptions(id: id, productOptions: productOptions, completionHandler: completionHandler)
    }

}

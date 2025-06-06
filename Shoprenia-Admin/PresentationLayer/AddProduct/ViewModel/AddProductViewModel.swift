//
//  AddproductViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation
import Shopify

class AddProductViewModel : ObservableObject{
    
    let createProductUseCase: CreateProductUsecaseProtocol
    let createProductOptionsUseCase: CreateProductOptionsUsecaseProtocol
    let createProductMediaUseCase: CreateProductMediaUsecaseProtocol
    @Published var creationStage : CreationStage = .firstStage
    
    init (createProductUseCase: CreateProductUsecaseProtocol,
          createProductOptionsUseCase: CreateProductOptionsUsecaseProtocol,
          createProductMediaUseCase: CreateProductMediaUsecaseProtocol) {
        self.createProductUseCase = createProductUseCase
        self.createProductOptionsUseCase = createProductOptionsUseCase
        self.createProductMediaUseCase = createProductMediaUseCase
    }
    
    func createProduct(title: String, description: String, productType: String, vendor: String){
        createProductUseCase.excute(title: title, description: title, productType: title, vendor: title) { result in
            switch result {
            case .success(_):
                print("Successfully Product Creation")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func createProductOptions(id : ID, productOptions : [OptionCreateInput]){
        createProductOptionsUseCase.excute(id: id, productOptions: productOptions) { result in
            switch result {
                case .success(_):
                print("Successfully Product Options Creation")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func createProductMedia(id : ID, media : [CreateMediaInput]){
        createProductMediaUseCase.excute(id: id, media: media) { result in
            switch result {
                case .success(_):
                print("Successfully Product Media Creation")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}

enum CreationStage{
    case firstStage
    case secondStage
    case thirdStage
}

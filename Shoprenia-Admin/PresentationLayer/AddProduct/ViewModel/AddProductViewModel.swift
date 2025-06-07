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
    let createProductVariantUseCase: CreateProductVariantsUsecaseProtocol
    @Published var creationStages : CreationStage = .firstStage
    @Published var productID : ID = .init()
    @Published var options : [CreateProductOptionsMutation.Data.ProductOptionsCreate.Product.Option] = []
    init (createProductUseCase: CreateProductUsecaseProtocol,
          createProductOptionsUseCase: CreateProductOptionsUsecaseProtocol,
          createProductMediaUseCase: CreateProductMediaUsecaseProtocol,createProductVariantUseCase : CreateProductVariantsUsecaseProtocol) {
        self.createProductUseCase = createProductUseCase
        self.createProductOptionsUseCase = createProductOptionsUseCase
        self.createProductMediaUseCase = createProductMediaUseCase
        self.createProductVariantUseCase = createProductVariantUseCase
    }
    
    func createProduct(title: String, description: String, productType: String, vendor: String){
        createProductUseCase.excute(title: title, description: description, productType: productType, vendor: vendor) {[unowned self] result in
            switch result {
            case .success(let id):
                print("Successfully Product Creation")
                print(id)
                self.productID = id
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func createProductOptions(id : ID, productOptions : [OptionCreateInput]){
        createProductOptionsUseCase.excute(id: id, productOptions: productOptions) { result in
            switch result {
                case .success(let options):
                    self.options = options
                    //self.creationStages = .thirdStage(id: id, options: options)
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
    
    func createProductVariants(id : ID, variants : [ProductVariantsBulkInput]){
        createProductVariantUseCase.excute(id: id, variants: variants) { result in
            switch result {
            case .success(_):
                print("Successfully Product Variants Creation")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}

enum CreationStage{
    case firstStage
    case secondStage(id : ID)
    case thirdStage(id : ID, options: [CreateProductOptionsMutation.Data.ProductOptionsCreate.Product.Option])
    case forthStage(id : ID)
}

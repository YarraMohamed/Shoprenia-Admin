//
//  AddproductViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation
import Shopify

class AddProductViewModel : ObservableObject{
    
    private let createProductUseCase: CreateProductUsecase
    private let createProductOptionsUseCase: CreateProductOptionsUsecase
    private let createProductMediaUseCase: CreateProductMediaUsecaseProtocol
    private let createProductVariantUseCase: CreateProductVariantsUsecaseProtocol
    private let updateProductVariantUsecase : UpdateProductVariantUsecase
    private let setInventoryquantityUseCase : SetInventoryQuantityUsecase
    
    @Published var creationStages : CreationStage = .firstStage
    @Published var product : ProductEntity? = nil
    @Published var options : [OptionEntity] = []
    @Published var variants : [VariantEntity] = []
    @Published var errorMessage : String? = nil
    @Published var isLoading : Bool = false
    
    init (createProductUseCase: CreateProductUsecase,
          createProductOptionsUseCase: CreateProductOptionsUsecase,
          createProductMediaUseCase: CreateProductMediaUsecaseProtocol,
          createProductVariantUseCase : CreateProductVariantsUsecaseProtocol,
          updateProductVariantUsecase : UpdateProductVariantUsecase,
          setInventoryQuantityUseCase : SetInventoryQuantityUsecase
    ){
        self.createProductUseCase = createProductUseCase
        self.createProductOptionsUseCase = createProductOptionsUseCase
        self.createProductMediaUseCase = createProductMediaUseCase
        self.createProductVariantUseCase = createProductVariantUseCase
        self.updateProductVariantUsecase = updateProductVariantUsecase
        self.setInventoryquantityUseCase = setInventoryQuantityUseCase
    }
    
    func createProduct(product : ProductEntity){
        isLoading = true
        createProductUseCase.execute(product: product) { result in
            switch result {
            case .success(let product):
                self.errorMessage = nil
                self.product = product
                self.isLoading = false
                self.creationStages = .secondStage
                print("product Id :\(product.id ?? "No ID") and product Tite \(product.title ?? "No Title")")
            case .failure(let failure):
                self.errorMessage = failure.localizedDescription
                self.isLoading = false
            }
        }
    }
    
    func createProductOptions(color : String , size : String){
        guard var product = self.product else { return }
        let options = [OptionEntity(
            id: nil,
            name: "Color",
            optionValues: [OptionValueEntity(
                id: nil,
                name: color
            )]
        ),OptionEntity(
            id: nil
            , name: "Size"
            , optionValues: [OptionValueEntity(
                name: size
            )]
        )]
        product.options = options
        createProductOptionsUseCase.execute(product: product) { result in
            switch result {
            case .success(let product):
                self.product?.options = product.options
                self.product?.variants = product.variants
                if let options = product.options {
                    self.options = options
                    print("Options Created Successfully")
                    print(self.options)
                }else{
                    self.errorMessage = "No Options Found"
                    print(self.errorMessage ?? "ERROOOOOOOR")
                }
            case .failure(let failure):
                self.errorMessage = failure.localizedDescription
                print(self.errorMessage ?? "ERROOOOOOOR") 
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
    
    func updateProductVariants(price : String , quantity : String){
        guard var product = self.product else { return }
        guard let variantID = product.variants?.first?.id else { return }
        
        let variant = VariantEntity(availableForSale: nil, id: variantID, price: price , title: product.variants?.first?.title, inventoryQuantity: nil)
        product.variants = [variant]
        updateProductVariantUsecase.execute(product: product) { result in
            switch result {
            case .success(let product):
                if let variants = product.variants{
                    self.variants = variants
                    self.setInventoryQuantity(quantity: quantity)
                    print(product.variants?.first?.price ?? "No Price")
                }else{
                    self.errorMessage = "No Variants Found"
                    print(self.errorMessage ?? "ERROOOOOOOR")
                }
            case .failure(let failure):
                self.errorMessage = failure.localizedDescription
                print(self.errorMessage ?? "ERROOOOOOOOR")
            }
        }
    }
    
    private func setInventoryQuantity(quantity : String){
        let inventory = InventoryEntity(quantities: [InventoryQuantity(
            inventoryItemId: product?.inventoryItemId, quantity: Int(quantity)
        )])
        setInventoryquantityUseCase.execute(inventory: inventory) { result in
            switch result{
            case .success(_):
                print("Added Quantity successfully")
                self.creationStages = .thirdStage
            case .failure(let error) :
                self.errorMessage = error.localizedDescription
                print(self.errorMessage ?? "EROOOOOOOOOR")
            }
        }
    }
    
}

enum CreationStage{
    case firstStage
    case secondStage
    case thirdStage
    case forthStage
}

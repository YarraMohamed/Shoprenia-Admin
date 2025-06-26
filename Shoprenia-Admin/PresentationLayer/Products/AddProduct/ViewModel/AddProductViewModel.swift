//
//  AddproductViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation
import Shopify
import SwiftUI

class AddProductViewModel : ObservableObject{
    
    private let createProductUseCase: CreateProductUsecase
    private let createProductOptionsUseCase: CreateProductOptionsUsecase
    private let createProductVariantUseCase: CreateProductVariantsUsecase
    private let updateProductVariantUsecase : UpdateProductVariantUsecase
    private let setInventoryquantityUseCase : SetInventoryQuantityUsecase
    private let publishProductUsecase : PublishProductUsecase
    @Published var creationStages : CreationStage = .firstStage
    @Published var product : ProductEntity? = nil
    @Published var options : [OptionEntity] = []
    @Published var variants : [VariantEntity] = []
    @Published var errorMessage : String? = nil
    @Published var isLoading : Bool = false
    
    init (createProductUseCase: CreateProductUsecase,
          createProductOptionsUseCase: CreateProductOptionsUsecase,
          createProductVariantUseCase : CreateProductVariantsUsecase,
          updateProductVariantUsecase : UpdateProductVariantUsecase,
          setInventoryQuantityUseCase : SetInventoryQuantityUsecase,
          publishProductUsecase : PublishProductUsecase
    ){
        self.createProductUseCase = createProductUseCase
        self.createProductOptionsUseCase = createProductOptionsUseCase
        self.createProductVariantUseCase = createProductVariantUseCase
        self.updateProductVariantUsecase = updateProductVariantUsecase
        self.setInventoryquantityUseCase = setInventoryQuantityUseCase
        self.publishProductUsecase = publishProductUsecase
    }
    
    func createProduct(title : String , description : String , productType : String , vendor : String , imageSources : [String]
                       ,stageNumber : Binding<Int> , progress : Binding<Double>){
        isLoading = true
        let imageEntity = imageSources.map{ imageSource in
            ImageEntity(originalSource: imageSource, alt: nil, imageContentType: .image)
        }
        let product = ProductEntity(id: nil, title: title, descriptionHTML: description, isGiftCard: nil, totalInventory: nil, vendor: vendor, productType: productType, tags: nil, variants: nil, options: nil, media: imageEntity, inventoryItemId: nil)
        createProductUseCase.execute(product: product) { result in
            switch result {
            case .success(let product):
                self.isLoading = false
                self.creationStages = .secondStage
                stageNumber.wrappedValue = 2
                progress.wrappedValue = 0.5
                self.errorMessage = nil
                self.product = product
                print("product Id :\(product.id ?? "No ID") and product Tite \(product.title ?? "No Title")")
                print(product.media?.first?.originalSource ?? "No media found")
            case .failure(let failure):
                self.isLoading = false
                self.errorMessage = failure.localizedDescription
            }
        }
    }
    
    func createProductOptions(color : String , size : String){
        guard var product = self.product else { return }
        isLoading = true
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
                self.isLoading = false
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
                self.isLoading = false
                self.errorMessage = failure.localizedDescription
                print(self.errorMessage ?? "ERROOOOOOOR") 
            }
        }
    }
    
    func updateProductVariants(price : String , quantity : String, stageNumber : Binding<Int> , progress : Binding<Double>){
        guard let variantID = self.product?.variants?.first?.id else { return }
        isLoading = true
        let variant = VariantEntity(
            availableForSale: nil,
            id: variantID,
            price: price ,
            title: nil,
            inventoryQuantity: nil
        )
        self.product?.variants = [variant]
        guard let product = self.product else { return }
        updateProductVariantUsecase.execute(product: product ) { result in
            switch result {
            case .success(let product):
                if let variants = product.variants{
                    self.variants = variants
                    self.setInventoryQuantity(quantity: quantity, stageNumber: stageNumber, progress: progress)
                    print(product.variants?.first?.price ?? "No Price")
                }else{
                    self.errorMessage = "No Variants Found"
                    print(self.errorMessage ?? "ERROOOOOOOR")
                    self.isLoading = false
                }
            case .failure(let failure):
                self.errorMessage = failure.localizedDescription
                print(self.errorMessage ?? "ERROOOOOOOOR")
                self.isLoading = false
            }
        }
    }
    
    private func setInventoryQuantity(quantity : String , stageNumber : Binding<Int> , progress : Binding<Double>){
        let inventory = InventoryEntity(quantities: [InventoryQuantity(
            inventoryItemId: product?.inventoryItemId, quantity: Int(quantity)
        )])
        self.product?.totalInventory = Int(quantity)
        setInventoryquantityUseCase.execute(inventory: inventory) { result in
            switch result{
            case .success(_):
                print("Added Quantity successfully")
                self.isLoading = false
                self.creationStages = .thirdStage
                progress.wrappedValue = 0.75
                stageNumber.wrappedValue = 3
            case .failure(let error) :
                self.isLoading = false
                self.errorMessage = error.localizedDescription
                print(self.errorMessage ?? "EROOOOOOOOOR")
            }
        }
    }
    
    func appendProductVariants(size : String , color : String , price : String, quantity : String){
        let variant : VariantEntity = VariantEntity(
            availableForSale: nil,
            id: nil,
            price: price,
            title: nil,
            inventoryQuantity: Int(quantity) ?? 0,
            variantValues: [VariantValue(
                optionName: "Color",
                value: color
            ),VariantValue(
                optionName: "Size",
                value: size
            )])
        self.product?.variants?.append(variant)
        print(self.product?.variants ?? [])
    }
        
    func createProductVariants(){
        guard var product = self.product else {return}
        product.variants?.remove(at: 0)
        createProductVariantUseCase.execute(product: product) { result in
            switch result {
            case .success(let product):
                print("Successfully Product Variant Creation")
                print(product.variants ?? [])
                print(product.variants ?? [])
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func publishProduct(path : Binding<NavigationPath>){
        guard let productID = self.product?.id else {return}
        isLoading = true
        publishProductUsecase.execute(productID:productID) { result in
            switch result{
            case .success(_):
                print("Congratulation you have create your product successfully")
                self.isLoading = false
                var myPath = path.wrappedValue
                myPath.removeLast(myPath.count-1)
                path.wrappedValue = myPath
            case .failure(let failure):
                print(failure.localizedDescription)
                self.isLoading = false
            }
        }
    }
    
}

enum CreationStage{
    case firstStage
    case secondStage
    case thirdStage
}

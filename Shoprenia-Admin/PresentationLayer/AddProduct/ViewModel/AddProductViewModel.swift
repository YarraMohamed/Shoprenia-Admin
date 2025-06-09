//
//  AddproductViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import Foundation
import Shopify

class AddProductViewModel : ObservableObject{
    
    private let createProductUseCase: CreateProductUsecaseProtocol
    private let createProductOptionsUseCase: CreateProductOptionsUsecaseProtocol
    private let createProductMediaUseCase: CreateProductMediaUsecaseProtocol
    private let createProductVariantUseCase: CreateProductVariantsUsecaseProtocol
    private let updateProductVariantUsecase : UpdateProductVariantUsecaseProtocol
    private let setInventoryquantityUseCase : SetInventoryQuantityUsecaseProtocol
    
    @Published var creationStages : CreationStage = .firstStage
    @Published var product : CreateProductMutation.Data.ProductCreate.Product? = nil
    @Published var options : [CreateProductOptionsMutation.Data.ProductOptionsCreate.Product.Option] = []
    @Published var variants : [CreateProductOptionsMutation.Data.ProductOptionsCreate.Product.Variants.Node] = []
    
    init (createProductUseCase: CreateProductUsecaseProtocol,
          createProductOptionsUseCase: CreateProductOptionsUsecaseProtocol,
          createProductMediaUseCase: CreateProductMediaUsecaseProtocol,
          createProductVariantUseCase : CreateProductVariantsUsecaseProtocol,
          updateProductVariantUsecase : UpdateProductVariantUsecaseProtocol,
          setInventoryQuantityUseCase : SetInventoryQuantityUsecaseProtocol
    ){
        self.createProductUseCase = createProductUseCase
        self.createProductOptionsUseCase = createProductOptionsUseCase
        self.createProductMediaUseCase = createProductMediaUseCase
        self.createProductVariantUseCase = createProductVariantUseCase
        self.updateProductVariantUsecase = updateProductVariantUsecase
        self.setInventoryquantityUseCase = setInventoryQuantityUseCase
    }
    
    func createProduct(title: String, description: String, productType: String, vendor: String){
        createProductUseCase.excute(title: title, description: description, productType: productType, vendor: vendor) {[unowned self] result in
            switch result {
            case .success(let product):
                print("Successfully Product Creation")
                self.product = product
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func createProductOptions(id : ID, productOptions : [OptionCreateInput]){
        createProductOptionsUseCase.excute(id: id, productOptions: productOptions) { result in
            switch result {
            case .success(let product):
                self.options = product.options
                self.variants = product.variants.nodes
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
    
    func updateProductVariants(productID : ID , variants : [ProductVariantsBulkInput],quantities : [Quantity]){
        updateProductVariantUsecase.excute(productID: productID, variants: variants) { result in
            switch result {
            case .success(_):
                print("Update variant successfully")
                self.setInventoryQuantity(inventoryQuantity: self.prepareQuantityInput(quantities: quantities))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setInventoryQuantity(inventoryQuantity : InventorySetQuantitiesInput){
        setInventoryquantityUseCase.excute(inventoryQuantity: inventoryQuantity) { result in
            switch result {
            case .success(_):
                print("Inventory Quantity Set Successfully")
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func prepareQuantityInput(quantities : [Quantity]) ->InventorySetQuantitiesInput{
        guard let inventoryItemID = product?.variants.nodes.first?.inventoryItem.id else {
            fatalError( "No inventory item found")
        }
        let quantityInput = quantities.map { quantity in
            InventoryQuantityInput(
                inventoryItemId: inventoryItemID , locationId: "gid://shopify/Location/72874229834", quantity:Int(quantity.quantity) ?? 0
            )
        }
        return  InventorySetQuantitiesInput(
            reason : "correction",
            name: "available",
            quantities: quantityInput,
            ignoreCompareQuantity : true
        )
    }
    
    func prepareVariantInput(quantities : [Quantity]) ->[ProductVariantsBulkInput]{
        guard let id = variants.first?.id else {
            fatalError("No ID for the variant is found")
        }
        return  quantities.map{ quantity in
            ProductVariantsBulkInput(
                id: GraphQLNullable<ID>.some(id),
                price: GraphQLNullable<Money>.some(quantity.price)
            )
        }
    }
    
}

enum CreationStage{
    case firstStage
    case secondStage
    case thirdStage(id : ID, options: [CreateProductOptionsMutation.Data.ProductOptionsCreate.Product.Option])
    case forthStage
}

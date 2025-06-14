//
//  UpdateProductViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 13/06/2025.
//

import Foundation
import Shopify

class UpdateProductViewModel: ObservableObject {
    
    private var myProduct : ProductEntity
    private let deleteProductUseCase: DeleteProductUsecase
    private let createProductUseCase: CreateProductUsecase
    private let createProductOptionsUseCase: CreateProductOptionsUsecase
    private let createProductVariantUseCase: CreateProductVariantsUsecase
    private let updateProductVariantUsecase : UpdateProductVariantUsecase
    private let setInventoryquantityUseCase : SetInventoryQuantityUsecase
    private let publishProductUsecase : PublishProductUsecase
    @Published var finish : Bool = false
    init(deleteProductUseCase: DeleteProductUsecase, createProductUseCase: CreateProductUsecase, createProductOptionsUseCase: CreateProductOptionsUsecase, createProductVariantUseCase: CreateProductVariantsUsecase, updateProductVariantUsecase: UpdateProductVariantUsecase, setInventoryquantityUseCase: SetInventoryQuantityUsecase, publishProductUsecase: PublishProductUsecase) {
        self.deleteProductUseCase = deleteProductUseCase
        self.createProductUseCase = createProductUseCase
        self.createProductOptionsUseCase = createProductOptionsUseCase
        self.createProductVariantUseCase = createProductVariantUseCase
        self.updateProductVariantUsecase = updateProductVariantUsecase
        self.setInventoryquantityUseCase = setInventoryquantityUseCase
        self.publishProductUsecase = publishProductUsecase
        self.myProduct = ProductEntity()
    }
    
    func updateProduct(
        oldProductID : ID ,
        title : String ,
        description : String ,
        productType : String ,
        vendor : String ,
        urls : [String] ,
        initialColor : String ,
        initialSize : String ,
        initialPrice : String ,
        initialQuantity : String,
        variants : [VariantModel]
    ){
        let imageEntity = urls.map{ImageEntity(originalSource: $0, alt: nil, imageContentType: .image)}
        
        let product = ProductEntity(id: nil, title: title, descriptionHTML: description, isGiftCard: nil, totalInventory: nil, vendor: vendor, productType: productType, tags: nil, variants: nil, options: nil, media: imageEntity, inventoryItemId: nil)
        
        createProductUseCase.execute(product: product) { result in
            switch result {
            case .success(let product):
                self.myProduct = product
                print("product Id :\(product.id ?? "No ID") and product Tite \(product.title ?? "No Title")")
                self.createProductOptions(oldProductID: oldProductID ,color: initialColor, size: initialSize, initialPrice: initialPrice , initialQuantity: initialQuantity, product: self.myProduct, variants: variants)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    private func createProductOptions(oldProductID : ID ,color : String , size : String ,initialPrice : String, initialQuantity : String, product : ProductEntity,variants : [VariantModel]){
        let options = [
            OptionEntity(
                id: nil,
                name: "Color",
                optionValues: [OptionValueEntity(id: nil,name: color)]),
            OptionEntity(
                id: nil,
                name: "Size",
                optionValues: [OptionValueEntity(name: size)])
        ]
        self.myProduct.options = options
        createProductOptionsUseCase.execute(product: myProduct) { result in
            switch result {
            case .success(let product):
                if let options = product.options {
                    print(options)
                    self.myProduct.options = options
                    self.myProduct.variants = product.variants
                    print("Options Created Successfully : ")
                    //\(String(describing: self.myProduct.options))
                    self.updateProductVariants(oldProductID: oldProductID, price: initialPrice, quantity: initialQuantity, product: self.myProduct,myVariants: variants)
                }else{
                    print("No options Found")
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    private func updateProductVariants(oldProductID : ID ,price : String , quantity : String, product : ProductEntity, myVariants : [VariantModel]
){
        guard let variantID = myProduct.variants?.first?.id else { return }
        let variant = VariantEntity(
            availableForSale: nil,
            id: variantID,
            price: price ,
            title: nil,
            inventoryQuantity: nil
        )
        self.myProduct.variants = [variant]
        updateProductVariantUsecase.execute(product: self.myProduct ) { result in
            switch result {
            case .success(let product):
                if let variants = product.variants{
                    self.myProduct.variants = variants
                    self.setInventoryQuantity(oldProductID: oldProductID, quantity: quantity,variants: myVariants)
                    print("Price added Successfully ")
                    //\(self.myProduct.variants?.first?.price ?? "No Price")
                }else{
                    print("No variants found")
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    private func setInventoryQuantity(oldProductID : ID ,quantity : String, variants : [VariantModel]){
        let inventory = InventoryEntity(quantities: [InventoryQuantity(
            inventoryItemId: myProduct.inventoryItemId, quantity: Int(quantity)
        )])
        self.myProduct.totalInventory = Int(quantity)
        setInventoryquantityUseCase.execute(inventory: inventory) { result in
            switch result{
            case .success(_):
                print("Added Quantity successfully")
                self.createProductVariants(oldProductID: oldProductID, variants: variants)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    private func createProductVariants(oldProductID : ID, variants : [VariantModel]){
        let variants = variants.map({$0.toVariantEntity()})
        myProduct.variants = variants
        myProduct.variants?.remove(at: 0)
        createProductVariantUseCase.execute(product: myProduct) { result in
            switch result {
            case .success(let product):
                self.myProduct.variants = product.variants
                print("Successfully Product Variant Creation : ")
               // \(String(describing: self.myProduct.variants))
                self.publishProduct(oldProductID: oldProductID )
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    private func publishProduct(oldProductID : ID){
        guard let productID = self.myProduct.id else {return}
        publishProductUsecase.execute(productID:productID) { result in
            switch result{
                case .success(_):
                print("Congratulation you have create your product successfully")
                self.deleteProduct(oldProductID: oldProductID)
                case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    private func deleteProduct(oldProductID : ID){
        deleteProductUseCase.execute(productID: oldProductID) { result in
            switch result{
            case .success(_):
                self.finish = true
                print("Congratulation you have delete your product successfully")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

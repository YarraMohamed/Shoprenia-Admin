//
//  MutationMapper.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 10/06/2025.
//

import Foundation
import Shopify


extension CreateProductMutation.Data.ProductCreate.Product{
    func toDomailModel() -> ProductEntity {
        return ProductEntity(id: id
                             , title: title
                             , descriptionHTML: descriptionHtml
                             , isGiftCard: nil
                             , totalInventory: nil, vendor: vendor
                             , productType: productType
                             , tags: tags
                             , variants: variants.toDomailModel()
                             , options: nil
                             , media: nil
                             , inventoryItemId:variants.nodes.first?.inventoryItem.id
        )
    }
}

extension CreateProductMutation.Data.ProductCreate.Product.Variants{
    func toDomailModel() -> [VariantEntity] {
        return self.nodes.map{ variant in
            VariantEntity(availableForSale: nil
                          , id: nil
                          , price: nil
                          , title: nil
                          , inventoryQuantity: nil
            )
        }
    }
}

extension OptionValueCreateInput{
    func toDomailModel() -> OptionValueEntity {
        return OptionValueEntity(
            id: nil,
            name: name.toDomailModel()
        )
    }
}

extension GraphQLNullable {
    func toDomailModel() -> Wrapped? {
        return switch self {
            case .some(let value):
            value
            default:
            nil
        }
    }
}
extension OptionEntity {
    func toDomainDTO() ->OptionCreateInput {
        let name = if let name = name {
            GraphQLNullable<String>.some(name)
        } else {
            GraphQLNullable<String>.none
        }
        
        return OptionCreateInput(name: name, position: nil, values: optionValues?.map{$0.toDomainDTO()} ?? [], linkedMetafield: nil)
            
    }
}

extension OptionValueEntity {
    func toDomainDTO() -> OptionValueCreateInput {
        OptionValueCreateInput(name: GraphQLNullable<String>.some(name ?? ""), linkedMetafieldValue: nil)
    }
}

extension CreateProductOptionsMutation.Data.ProductOptionsCreate.Product{
    func toDomainModel()-> ProductEntity{
        return ProductEntity(
            variants: variants.nodes.map({$0.toDomainModel()}), options: options.map{$0.toDomainModel()},inventoryItemId: variants.nodes.first?.id
        )
    }
}

extension CreateProductOptionsMutation.Data.ProductOptionsCreate.Product.Option{
    func toDomainModel() -> OptionEntity {
        return OptionEntity(
            id: id,
            name: name,
            optionValues: self.values.map{ value in
                OptionValueEntity(hasVariants: nil, id: nil, name: value)}
            )
    }
}

extension CreateProductOptionsMutation.Data.ProductOptionsCreate.Product.Variants.Node {
    func toDomainModel()-> VariantEntity {
        VariantEntity(availableForSale: nil,
                      id: id,
                      price: price,
                      title: title,
                      inventoryQuantity: nil)
    }
}

// MARK
extension VariantEntity{
    func toDomainDTO()-> ProductVariantsBulkInput{
        return ProductVariantsBulkInput(
            // WARNING: Do not send empty string; send nil.
            id : id.toGraphQLNullable(),
            price: price.toGraphQLNullable(),
        )
    }
}

extension UpdateProductVariantsMutation.Data.ProductVariantsBulkUpdate.Product{
    func toDomainModel()-> ProductEntity{
        return ProductEntity(
            variants: self.variants.nodes.map({$0.toDomainModel()})
        )
    }
}

extension UpdateProductVariantsMutation.Data.ProductVariantsBulkUpdate.Product.Variants.Node {
    func toDomainModel()-> VariantEntity{
        VariantEntity(availableForSale: nil,
                      id: id,
                      price: price,
                      title: title,
                      inventoryQuantity: nil)
    }
}

extension InventoryEntity{
    func toDomainDTO()-> InventorySetQuantitiesInput{
        return InventorySetQuantitiesInput(reason: reason, name: name, referenceDocumentUri: nil, quantities: quantities?.map{$0.toDomainDTO()} ?? [], ignoreCompareQuantity: GraphQLNullable<Bool>.some(ignoreCompareQuantity))
    }
}

extension InventoryQuantity{
    func toDomainDTO()-> InventoryQuantityInput {
        guard let inventoryItemId = inventoryItemId else { fatalError("inventoryItemId is required") }
        return InventoryQuantityInput(inventoryItemId: inventoryItemId, locationId: locationId, quantity: quantity ?? 0)
    }
}


extension String? {
    func toGraphQLNullable() -> GraphQLNullable<String> {
        return if let value = self {
            GraphQLNullable<String>.some(value)
        } else {
            GraphQLNullable<String>.none
        }
    }
}

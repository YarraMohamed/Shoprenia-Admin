//
//  QueriesMapper.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 10/06/2025.
//

import Foundation
import Shopify

extension GetProductByIDQuery.Data.Product {
    func toDomainModel() -> ProductEntity {
        return ProductEntity(id: id
                             , title: title
                             , descriptionHTML: descriptionHtml
                             , isGiftCard: isGiftCard
                             , totalInventory: totalInventory
                             , vendor: vendor
                             , productType: productType
                             , tags: tags
                             , variants: variants.toDomainModel()
                             , options: self.options.map{ $0.toDomainModel() }
                             , media: self.media.nodes.compactMap{ ImageEntity(url: $0.asMediaImage?.image?.url) }
                             ,inventoryItemId: nil
        )
        
    }
}

extension GetProductByIDQuery.Data.Product.Variants {
    func toDomainModel() -> [VariantEntity] {
        return self.nodes.map { variant in
            VariantEntity(availableForSale: variant.availableForSale
                          , id: variant.id
                          , price: variant.price
                          , title: variant.title
                          , inventoryQuantity: variant.inventoryQuantity
            )
        }
    }
}

extension GetProductByIDQuery.Data.Product.Option {
    func toDomainModel() -> OptionEntity {
        return OptionEntity(id: id
            , name: name
            , optionValues: self.optionValues.compactMap({ optionValue in
                OptionValueEntity(
                    hasVariants: optionValue.hasVariants
                    , id: optionValue.id
                    , name: optionValue.name
                )
        }))
    }
}


extension CreateProductMutation {
    static func from(entity: ProductEntity) -> CreateProductMutation? {
        guard
            let title = entity.title,
            let descriptionHtml = entity.descriptionHTML,
            let productType = entity.productType,
            let vendor = entity.vendor
        else {
            return nil
        }

        return CreateProductMutation(
            title: title,
            descriptionHtml: descriptionHtml,
            productType: productType,
            vendor: vendor
        )
    }
}

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
                             , media: self.media.nodes.compactMap{ ImageEntity(originalSource: $0.asMediaImage?.image?.url, alt: nil, imageContentType: .image) }
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

extension GetVendorProductsQuery.Data.Products.Node{
    func toDomainModel()->ProductEntity{
        return ProductEntity(
            id: id,
            title: title,
            descriptionHTML: nil,
            isGiftCard: nil,
            totalInventory: totalInventory,
            vendor: nil,
            productType: nil,
            tags: nil,
            variants: variants.nodes.map{$0.toDomainModel()},
            options: nil,
            media: media.nodes.map{$0.toDomainModel()},
            inventoryItemId: nil
        )
    }
}

extension GetVendorProductsQuery.Data.Products.Node.Variants.Node{
    func toDomainModel() -> VariantEntity{
        return VariantEntity(availableForSale:self.availableForSale , id: nil, price: self.price, title: nil, inventoryQuantity: nil, variantValues: nil)
    }
}

extension GetVendorProductsQuery.Data.Products.Node.Media.Node{
    func toDomainModel()->ImageEntity{
        return ImageEntity(originalSource: self.asMediaImage?.image?.url, alt:nil, imageContentType: .image)
    }
}

extension GetProductsQuery.Data.Products.Node{
    func toDomainModel()->ProductEntity{
        return ProductEntity(
            id: id,
            title: title,
            descriptionHTML: nil,
            isGiftCard: nil,
            totalInventory: totalInventory,
            vendor: nil,
            productType: nil,
            tags: nil,
            variants: variants.nodes.map{$0.toDomainModel()},
            options: nil,
            media: media.nodes.map{$0.toDomainModel()},
            inventoryItemId: nil
        )
    }
}

extension GetProductsQuery.Data.Products.Node.Media.Node{
    func toDomainModel()->ImageEntity{
        return ImageEntity(originalSource: self.asMediaImage?.image?.url, alt:nil, imageContentType: .image)
    }
}

extension GetProductsQuery.Data.Products.Node.Variants.Node{
    func toDomainModel() -> VariantEntity{
        return VariantEntity(availableForSale:self.availableForSale , id: nil, price: self.price, title: nil, inventoryQuantity: nil, variantValues: nil)
    }
}

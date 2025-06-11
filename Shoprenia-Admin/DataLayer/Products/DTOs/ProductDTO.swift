//
//  ProductDTO.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 09/06/2025.
//

import Foundation
import Shopify

struct ProductEntity: Codable {
    var id : String? = nil
    var title : String? = nil
    var descriptionHTML: String? = nil
    var isGiftCard: Bool? = nil
    var totalInventory: Int? = nil
    var vendor : String? = nil
    var productType: String? = nil
    var tags: [String]? = nil
    var variants: [VariantEntity]? = nil
    var options: [OptionEntity]? = nil
    var media: [ImageEntity]? = nil
    var inventoryItemId : String? = nil
    
    
}

struct ImageEntity: Codable {
    var originalSource : String? = nil
    var alt : String? = nil
    var imageContentType : MediaType = .image
}

struct OptionEntity: Codable {
    var id : String? = nil
    var name: String? = nil
    var optionValues: [OptionValueEntity]? = nil
}

struct OptionValueEntity: Codable {
    var hasVariants: Bool? = nil
    var id : String? = nil
    var name: String? = nil
}

struct VariantEntity: Codable {
    var availableForSale: Bool? = nil
    var id : String? = nil
    var price : String? = nil
    var title: String? = nil
    var inventoryQuantity: Int? = nil
    var variantValues : [VariantValue]? = nil // array of two objects one for colorOption and its value (Red) and the other for sizeOption and its value (small)
}


struct InventoryEntity : Codable {
    var reason : String = "correction"
    var name : String = "available"
    var ignoreCompareQuantity: Bool = true
    var quantities : [InventoryQuantity]? = nil
    
}

struct InventoryQuantity : Codable {
    var inventoryItemId : String? = nil
    var locationId : String = "gid://shopify/Location/72874229834"
    var quantity : Int? = nil
}

struct VariantValue : Codable {
    var optionName : String? = nil
    var value : String? = nil
}

enum MediaType : String,Codable {
    case video = "VIDEO"
    case externalVideo = "EXTERNAL_VIDEO"
    case model3D = "MODEL_3D"
    case image = "IMAGE"
}

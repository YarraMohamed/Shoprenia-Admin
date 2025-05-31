//
//  AppRoute.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 01/06/2025.
//

import Foundation
import Shopify

enum AppRoute : Hashable {
    case homeScreen
    case productDetails(product : GetProductsQuery.Data.Products.Node)
    case vendorProducts(vendorName : String)
}

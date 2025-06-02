//
//  ProductDetails.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 03/06/2025.
//

import SwiftUI
import Shopify

struct ProductDetailsScreen: View {
    var product : GetProductByIDQuery.Data.Product?
    var body: some View {
        Text("Product Details")
    }
}


#Preview {
    ProductDetailsScreen(product: nil)
}

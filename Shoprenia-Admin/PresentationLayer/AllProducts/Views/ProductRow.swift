//
//  ProductRow.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import SwiftUI
import Shopify

struct ProductRow: View {
    @Binding var path : NavigationPath
    var product : GetProductsQuery.Data.Products.Node?
    var body: some View {
        VStack{
                if let imageURL = product?.media.nodes.first?.asMediaImage?.image?.url ,
                   let imageUrl = URL(string : imageURL) {
                    VendorImage(imageUrl:imageUrl).padding(.bottom,10)
                }else{
                    Image(.brandImg)
                        .resizable()
                        .scaledToFit()
                        .frame(width:150, height: 160).padding(.bottom,10)
                }
                Text(product?.title ?? "NO TITLE")
                    .font(.system(size: 12, weight: .medium, design: .default))
                    .multilineTextAlignment(.center)
                    .padding(.bottom,5)
                Text("Counts : \(product?.totalInventory ?? 0)")
                    .font(.system(size: 12, weight: .medium, design: .default))
                    .multilineTextAlignment(.center)
                    .padding(.bottom,5)
                Text("\(product?.variants.nodes.first?.price ?? "No Price") egp")
                    .font(.system(size: 12, weight: .medium, design: .default))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.shopreniaBlue)
                    Spacer()
        }.padding()
            .background(Color.productBG)
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
            .onTapGesture {
                print(product?.title ?? "No Title")
                guard let product = product else { return }
                path.append(AppRoute.productDetails(product: product))
            }
    }
}

#Preview {
    //ProductRow(product: GetProductsQuery.Data.Products.Node(_dataDict: DataDict(data: [String : AnyHashable](), fulfilledFragments: Set<ObjectIdentifier>())))
}

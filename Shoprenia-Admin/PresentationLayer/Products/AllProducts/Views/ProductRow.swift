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
    var product : ProductEntity?
    @Binding var showAlert : Bool
    @Binding var productState : ID
    var body: some View {
        ZStack(alignment : .topTrailing){
            
            VStack(alignment : .center){
                if let imageURL = product?.media?.first?.originalSource ,
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
                Text("\(product?.variants?.first?.price ?? "No Price") egp")
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
                    guard let productID = product?.id else { return }
                    path.append(AppRoute.productDetails(productID: productID))
                }
            Button{
                showAlert = true
                guard let productID = product?.id else { return }
                productState = productID
            }label: {
                Image(.delete)
            }.padding(.top , 5)
                .padding(.trailing , 5)
            
        }

    }
}

#Preview {
    //ProductRow(path: Binding<NavigationPath>(nil) ,product: nil)
}

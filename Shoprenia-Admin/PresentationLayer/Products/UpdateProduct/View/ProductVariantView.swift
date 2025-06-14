//
//  ProductVariantView.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 12/06/2025.
//

import SwiftUI

struct ProductVariantView: View {
    var product : ProductEntity
    @Binding var variants : [VariantModel]
    @State var showAlert: Bool = false
    @State var showError: Bool = false
    var body: some View {
        Text("Variants Section : ")
            .foregroundStyle(Color("shopreniaBlue"))
            .font(.system(size: 28, weight: .medium, design: .default))
        VStack{
            VariantSection(showError: $showError, variants: $variants)
        }.padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
            .frame(maxWidth: .infinity)
        if showError{
            Text("Please Complete all Fields To Add Variant !")
                .foregroundStyle(.red)
                .font(.system(size: 22, weight: .medium, design: .default))
        }else{
            LazyVStack(alignment: .leading, spacing: 10){
                ForEach(variants, id: \.self){ variant in
                    VariantView(showAlert: $showAlert, variant: variant)
                        .alert("URL Deletion !", isPresented: $showAlert) {
                        Button("Delete", role: .destructive){
                            variants.removeAll(where: { $0 == variant })
                        }
                    }message: {
                        Text("Are you sure you want to delete this url ?")
                    }
                }
            }
        }
    }
}

struct VariantSection : View {
    @State var color : String = ""
    @State var size : String = ""
    @State var price : String = ""
    @State var quantity : String = ""
    @Binding var showError : Bool
    @Binding var variants : [VariantModel]
    var body: some View {
        VStack(alignment: .leading,spacing: 20){
            VStack(alignment : .leading, spacing : 20){
                HStack(spacing : 20){
                    Text("Add Color")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(Color("shopreniaBlue"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(title: "color variant", input: $color, width: 250)
                }
                HStack(spacing : 20){
                    Text("Add Size")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(Color("shopreniaBlue"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(title: "size variant", input: $size, width: 250)
                }
            }
            HStack(spacing : 20){
                Text("Variant Price").foregroundStyle(Color("shopreniaBlue"))
                    .font(.system(size: 20, weight: .medium, design: .default))
                CustomTextField(title: "Price", input: $price, width: 200)
            }
            HStack(spacing : 20){
                Text("Variant Quantity").foregroundStyle(Color("shopreniaBlue"))
                    .font(.system(size: 20, weight: .medium, design: .default))
                CustomTextField(title: "Quantity", input: $quantity, width: 200)
            }
            HStack{
                Button {
                    if !color.isEmpty && !size.isEmpty && !price.isEmpty && !quantity.isEmpty {
                        let variant = VariantModel(color: color, size: size, quantity: Int(quantity)!, price: Double(price)!)
                        showError = false
                        variants.append(variant)
                    }else{
                        showError = true
                    }
                    
                } label: {
                    Text("Add Variant")
                    Image(.addCircle)
                }
            }.frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct VariantView : View {
    @Binding var showAlert : Bool
    var variant : VariantModel
    var body: some View{
        HStack{
            VStack {
                HStack{
                    Text("Variant").foregroundStyle(Color("shopreniaBlue"))
                    Spacer()
                    Text("\(variant.color) / \(variant.size)")
                }
                HStack {
                    Text("Quantity").foregroundStyle(Color("shopreniaBlue"))
                    Spacer()
                    Text("\(variant.quantity)")
                }
                HStack {
                    Text("Price").foregroundStyle(Color("shopreniaBlue"))
                    Spacer()
                    Text(String(format: "EGP %.2f", variant.price))
                }
            }.padding(.horizontal)
                .padding(.vertical, 5)
                .frame(maxWidth : .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            Button{
                showAlert = true
            }label: {
                Image(systemName: "minus.circle")
                    .foregroundStyle(Color("shopreniaBlue"))
            }
        }
    }
}

extension VariantEntity{
    func toVariantModel() -> VariantModel{
        return VariantModel(
            color: String(self.title?.split(separator:"/").first ?? "MapIssue")
            ,size: String(self.title?.split(separator: "/").last ?? "MapIssue")
             ,quantity: self.inventoryQuantity ?? 0, price: Double(self.price ?? "0.0") ?? 0.0
        )
    }
}

extension VariantModel{
    func toVariantEntity() -> VariantEntity{
        return VariantEntity(
            availableForSale: true,
            id: nil,
            price: String(self.price),
            title:nil,
            inventoryQuantity: self.quantity,
            variantValues: [VariantValue(
                optionName: "Color",
                value: self.color
            ),
            VariantValue(
                optionName: "Size",
                value: self.size
            )])
    }
}

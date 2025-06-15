//
//  ProductOptionView.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 12/06/2025.
//

import SwiftUI

struct ProductOptionView: View {
    var product : ProductEntity
    @Binding var initialColor : String
    @Binding var initialSize : String
    @Binding var initialPrice : String
    @Binding var initialQuantity : String
    @State var colors : [String] = []
    @State var sizes : [String] = []
    @State var disabledButton : Bool = false
    @State var quantities : [Quantity] = []
    var body: some View {
        ScrollView{
            VStack(spacing : 10){
                Text("Color Options Section : ")
                    .foregroundStyle(Color("shopreniaBlue"))
                    .font(.system(size: 20, weight: .medium, design: .default))
                ColorOptionSection(color: $initialColor, colors: $colors)
                Text("Size Options Section : ")
                    .foregroundStyle(Color("shopreniaBlue"))
                    .font(.system(size: 20, weight: .medium, design: .default))
                SizeOptionSection(size: $initialSize, sizes: $sizes)
                PriceAndQuantitySection(initialPrice: $initialPrice, initialQuantity: $initialQuantity, quantities: $quantities)
            }.padding()
        }
    }
}

struct ColorOptionSection : View {
    @Binding var color : String
    @Binding var colors : [String]
    @State var disableButton : Bool = false
    var body: some View {
        VStack(spacing : 10){
            HStack(spacing : 20){
                CustomTextField(title: "Add Initial Color", input: $color, width: 300)
                Button {
                    if !color.isEmpty {
                        colors.append(color)
                        disableButton = true
                    }
                    
                } label: {
                    Image(.addCircle)
                }.disabled(disableButton)
                 .hidden(disableButton)
            }
        }.padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
            
        LazyVStack(alignment: .leading, spacing: 5) {
            ForEach(colors, id: \.self) { color in
                    Text(color)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .frame(maxWidth : .infinity)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
            }
        }
    }
}


struct SizeOptionSection : View {
    @Binding var size : String
    @Binding var sizes : [String]
    @State var disableButton : Bool = false
    var body : some View {
        VStack(spacing : 10){
            HStack(spacing : 20){
                CustomTextField(title: "Add Initial Size", input: $size, width: 300)
                Button {
                    if !size.isEmpty{
                        sizes.append(size)
                        disableButton = true
                    }
                } label: {
                    Image(.addCircle)
                }.disabled(disableButton)
                    .hidden(disableButton)
            }
            
        }.padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
            
        LazyVStack(alignment: .leading, spacing: 5) {
            ForEach(sizes, id: \.self) { size in
                Text(size)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
        }
    }
}


struct PriceAndQuantitySection : View {
    @Binding var initialPrice : String
    @Binding var initialQuantity : String
    @Binding var quantities : [Quantity]
    @State var disableButton : Bool = false
    var body: some View {
        VStack(spacing : 20){
            Text("Add Price & Quantity Section : ")
                .foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 20, weight: .medium, design: .default))
            VStack(spacing : 10){
                HStack(spacing : 20){
                    Text("Price :")
                    CustomTextField(title: "Add Price", input: $initialPrice, width: 250)
                }
                HStack(spacing : 20){
                    Text("Quantity :")
                    CustomTextField(title: "Add Quanity", input: $initialQuantity, width: 250)
                }
                Button{
                    if !initialPrice.isEmpty && !initialQuantity.isEmpty{
                        let quantity = Quantity(price: initialPrice, quantity: initialQuantity)
                        quantities.append(quantity)
                        disableButton = true
                        }
                }label :{
                    Text("Add").foregroundStyle(Color("shopreniaBlue"))
                    Image(.addCircle)
                }.hidden(disableButton)
                    .disabled(disableButton)

            }.padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
                
            LazyVStack{
                ForEach(quantities,id: \.self){ quantity in
                    HStack{
                        Text("Price :").foregroundStyle(Color("shopreniaBlue"))
                        Spacer()
                        Text(quantity.price)
                    }
                    HStack{
                        Text("Quantity :").foregroundStyle(Color("shopreniaBlue"))
                        Spacer()
                        Text(quantity.quantity)
                    }
                }.padding(.horizontal)
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
        }
    }
}

//
//  SecondStageView.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import SwiftUI
import Shopify

struct SecondStageView : View {
    var viewModel : AddProductViewModel
    @State var color : String = ""
    @State var size : String = ""
    @State var colors : [String] = []
    @State var sizes : [String] = []
    @State var disableColorButton : Bool = false
    @State var disableSizeButton : Bool = false
    @Binding var progress: Double
    @Binding var stageNumber: Int
    var body: some View{
        ScrollView{
            VStack(spacing : 10){
                Text("Add Color Options Section : ")
                    .foregroundStyle(Color("shopreniaBlue"))
                    .font(.system(size: 20, weight: .medium, design: .default))
                
                AddColorOptionSection(viewModel: viewModel, color: $color, colors: $colors, disableButton: $disableColorButton)
                
                Text("Add Size Options Section : ")
                    .foregroundStyle(Color("shopreniaBlue"))
                    .font(.system(size: 20, weight: .medium, design: .default))
                AddSizeOptionSection(viewModel: viewModel, size: $size, sizes: $sizes, disableButton: $disableSizeButton,colors: $colors)
                AddPriceAndQuantitySection(viewModel: viewModel)
            }.padding()
            
        }
        CustomButton(title: "Next") {
            progress = 0.75
            viewModel.creationStages = .thirdStage
            stageNumber = 3
        }
    }
}

struct AddColorOptionSection : View {
    var viewModel : AddProductViewModel
    @Binding var color : String
    @Binding var colors : [String]
    @Binding var disableButton : Bool
    var body: some View {
        VStack(spacing : 10){
            HStack(spacing : 20){
                CustomTextField(title: "Add Initial Color", input: $color, width: 300)
                Button {
                    if !color.isEmpty {
                        colors.append(color)
                        color = ""
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


struct AddSizeOptionSection : View {
    var viewModel : AddProductViewModel
    @Binding var size : String
    @Binding var sizes : [String]
    @Binding var disableButton : Bool
    @Binding var colors : [String]
    var body : some View {
        VStack(spacing : 10){
            HStack(spacing : 20){
                CustomTextField(title: "Add Initial Size", input: $size, width: 300)
                Button {
                    if !size.isEmpty{
                        sizes.append(size)
                        size = ""
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
        CustomButton(title: "Submit Color and Size"){
            viewModel.createProductOptions(color: colors.first ?? "", size: sizes.first ?? "")
        }
    }
}


struct AddPriceAndQuantitySection : View {
    var viewModel : AddProductViewModel
    @State var price : String = ""
    @State var quantityS : String = ""
    @State var quantities : [Quantity] = []
    @State var disableButton : Bool = false
    var body: some View {
        VStack(spacing : 20){
            Text("Add Price & Quantity Section : ")
                .foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 20, weight: .medium, design: .default))
            VStack(spacing : 10){
                HStack(spacing : 20){
                    Text("Price :")
                    CustomTextField(title: "Add Price", input: $price, width: 250)
                }
                HStack(spacing : 20){
                    Text("Quantity :")
                    CustomTextField(title: "Add Quanity", input: $quantityS, width: 250)
                }
                Button{
                    if !price.isEmpty && !quantityS.isEmpty{
                        let quantity = Quantity(price: price, quantity: quantityS)
                        quantities.append(quantity)
                        viewModel.updateProductVariants(price: price,quantity: quantityS)
                        price = ""
                        quantityS = ""
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


struct Quantity : Hashable {
    var price : String = ""
    var quantity : String = ""
}


extension View{
    @ViewBuilder
    func hidden(_ ishidden : Bool) ->some View{
        if ishidden{
            self.hidden()
        }else{
            self
        }
    }
}

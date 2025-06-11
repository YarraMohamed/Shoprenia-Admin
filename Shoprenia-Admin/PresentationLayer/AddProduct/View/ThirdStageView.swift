//
//  ThirdStageView.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 10/06/2025.
//

import SwiftUI
import Shopify

struct ThirdStageView : View {
    var viewModel : AddProductViewModel
    @State var color : String = ""
    @State var size : String = ""
    @State var price : String = ""
    @State var quantity : String = ""
    @Binding var progress: Double
    @Binding var stageNumber: Int
    @State var showError : Bool = false
    @State var isHidden : Bool = false
    @State var variants : [VariantModel] = []
   
    var body: some View{
        ScrollView{
            Text("Add Variants Section : ")
                .foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 28, weight: .medium, design: .default))
            VStack{
                AddVariantSection(viewModel: viewModel,color: $color, size: $size, price: $price, quantity: $quantity,showError: $showError, variants: $variants)
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
                    }
                }
            }
            
            Spacer()
            CustomButton(title: "Save and Publish") {
                if !variants.isEmpty{
                    viewModel.createProductVariants()
                    viewModel.publishProduct()
                }
            }
        }.padding(.top , 30)
            .padding()
    }
}


struct AddVariantSection : View {
    var viewModel : AddProductViewModel
    @Binding var color : String
    @Binding var size : String
    @Binding var price : String
    @Binding var quantity : String
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
            Button {
                if !color.isEmpty && !size.isEmpty && !price.isEmpty && !quantity.isEmpty {
                    let variant = VariantModel(color: color, size: size, quantity: Int(quantity)!, price: Double(price)!)
                    showError = false
                    viewModel.appendProductVariants(size: size ,color: color, price: price, quantity: quantity)
                    variants.append(variant)
                    color = ""
                    size = ""
                    price = ""
                    quantity = ""
                }else{
                    showError = true
                }
                
            } label: {
                Text("Add Variant")
                Image(.addCircle)
            }
        }
    }
}




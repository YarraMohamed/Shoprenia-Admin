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
    @Binding var progress: Double
    @Binding var stageNumber: Int
    var body: some View{
        VStack(spacing : 20){
            Text("Add Color Options Section : ")
                .foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 28, weight: .medium, design: .default))
            VStack(spacing : 20){
                HStack(spacing : 20){
                    CustomTextField(title: "Add Color", input: $color, width: 300)
                    Button {
                        if !color.isEmpty {
                            colors.append(color)
                            let colorValues = colors.map { OptionValueCreateInput(name: GraphQLNullable<String>.some($0)) }
                            let options :[OptionCreateInput] = [
                                OptionCreateInput(
                                    name: "Color",
                                    values: GraphQLNullable<[OptionValueCreateInput]>.some(colorValues)
                                )
                            ]
                            viewModel.createProductOptions(id: viewModel.productID, productOptions: options)
                            color = ""
                        }
                        
                    } label: {
                        Image(.addCircle)
                    }
                }
            }.padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
                .frame(maxWidth: .infinity)
            List{
                ForEach(colors, id: \.self){ color in
                    Text(color)
                }
            }
            Text("Add Size Options Section : ")
                .foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 28, weight: .medium, design: .default))
            VStack(spacing : 20){
                HStack(spacing : 20){
                    CustomTextField(title: "Add Size", input: $size, width: 300)
                    Button {
                        if !size.isEmpty{
                            sizes.append(size)
                            let sizeValues = sizes.map{OptionValueCreateInput(name: GraphQLNullable<String>.some($0))}
                            let options = [ OptionCreateInput(
                                name : "Size",
                                values : GraphQLNullable<[OptionValueCreateInput]>.some(sizeValues)
                                )
                            ]
                            viewModel.createProductOptions(id: viewModel.productID, productOptions: options)
                            size = ""
                        }
                    } label: {
                        Image(.addCircle)
                    }
                }
                
            }.padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
                .frame(maxWidth: .infinity)
            List{
                ForEach(sizes, id: \.self){ size in
                    Text(size)
                }
            }
            CustomButton(title: "Next") {
                progress = 0.75
                viewModel.creationStages = .thirdStage(id: viewModel.productID, options: viewModel.options)
                stageNumber = 3
            }
        }.padding(.top , 80)
            .padding()
    }
}

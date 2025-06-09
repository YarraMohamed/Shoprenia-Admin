//
//  FirstStageView.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import SwiftUI

struct FirstStageView : View {
    @State var title : String = ""
    @State var description : String = ""
    @State var type : String = ""
    @State var vendor : String = ""
    @Binding var progress : Double
    @Binding var stageNumber : Int
    var viewModel : AddProductViewModel
    var body : some View {
        VStack(spacing : 20){
            VStack(spacing : 20){
                VStack(alignment : .leading){
                    Text("Product Title")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(Color("shopreniaBlue"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(title: "Title", input: $title,width: 350)
                        
                }
                .padding(.top , 20)
                .padding(.horizontal)
                VStack(alignment : .leading){
                    Text("Product Description")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(Color("shopreniaBlue"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(title: "Description", input: $description,width: 350)
                        
                }
                .padding(.horizontal)
                HStack{
                    Text("Product Type")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(Color("shopreniaBlue"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(title: "Type", input: $type , width: 170)
                    Spacer()
                    
                }
                .padding(.horizontal)
                HStack{
                    Text("Product Vendor")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(Color("shopreniaBlue"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(title: "Vendor", input: $vendor , width: 170)
                    Spacer()
                    
                }
                .padding(.horizontal)
                
            }.padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
                .frame(maxWidth: .infinity)
            
            CustomButton(title: "Next") {
                viewModel.createProduct(title: title, description: description, productType: type, vendor: vendor)
//                guard let productID = viewModel.product?.id else{
//                    fatalError("Product Id is Found nil")
//                }
                viewModel.creationStages = .secondStage
                progress = 0.5
                stageNumber = 2
                
            }
        }.padding(.top , 80)
            .padding()
    }
}

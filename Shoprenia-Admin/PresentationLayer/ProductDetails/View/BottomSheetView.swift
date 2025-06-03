//
//  BottomSheetView.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 04/06/2025.
//

import SwiftUI

struct BottomSheetView : View {
    @State var size : String = ""
    @State var color : String = ""
    @State var price : String = ""
    @State var inventory : String = ""
    @Binding var showBottomSheet : Bool
    var body: some View {
        VStack(spacing : 20){
            VStack(spacing : 20){
                VStack{
                    Text("Add Size")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(Color("shopreniaBlue"))
                        .frame(maxWidth: .infinity, alignment: .center)
                    CustomTextField(title: "Add New Size", input: $size,width: 250)
                }
                .padding(.top , 20)
                .padding(.horizontal)
                VStack{
                    Text("Add Color")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(Color("shopreniaBlue"))
                        .frame(maxWidth: .infinity, alignment: .center)
                    CustomTextField(title: "Add New Color", input: $color,width: 250)
                }
                .padding(.horizontal)
                HStack{
                    Text("Add Price")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(Color("shopreniaBlue"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(title: "Add New Price", input: $price , width: 150)
                    Spacer()
                    
                }
                .padding(.horizontal)
                HStack{
                    Text("Update Inventory")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(Color("shopreniaBlue"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(title: "Update Inventory", input: $inventory , width: 150)
                    Spacer()
                    
                }
                .padding(.horizontal)
                
            }.padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
                .frame(maxWidth: .infinity)
        }.padding()
        CustomButton(title: "Update") {
            print("Updated")
            showBottomSheet = false
        }
    }
}


struct CustomTextField : View {
    var title : String
    @Binding var input : String
    var width : CGFloat
    var body: some View {
        TextField(title,text : $input)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: width,height: 45)
    }
}

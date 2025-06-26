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
    let productTypes : [String] = ["SHOES","T-SHIRTS","ACCESSORIES"]
    let availableVendors : [String] = ["vans","adidas","nike","converse","puma","asic-tiger","palladium","supra","timberland","dr-martens","herschel","flex-fit"]
    var viewModel : AddProductViewModel
    @State var urls : [String] = []
    var body : some View {
        ScrollView{
            VStack(spacing : 20){
                Text("Add Product Info Section : ")
                    .foregroundStyle(Color("shopreniaBlue"))
                    .font(.system(size: 28, weight: .medium, design: .default))
                VStack(alignment : .leading){
                    Text("Product Title")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(Color("shopreniaBlue"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(title: "Title", input: $title,width: 350)
                        
                }
                .padding(.top , 10)
               // .padding(.horizontal)
                VStack(alignment : .leading){
                    Text("Product Description")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(Color("shopreniaBlue"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                   // CustomTextField(title: "Description", input: $description,width: 350)
                    DescriptionInputView(description: $description)
                        
                }
                .padding(.horizontal)
                HStack(spacing : 10){
                    CustomMenu(sentData: productTypes, menuLabel: "Select Product Type", textLabel: "Product Type",type: $type)
                }
                .padding(.horizontal)
                HStack{
                    CustomMenu(sentData: availableVendors, menuLabel: "Select Product Vendor", textLabel: "Product Vendor", type: $vendor)
                }
                .padding(.horizontal)
                
               
            }.padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
                .frame(maxWidth: .infinity)
            
            AddMediaSection(viewModel: viewModel, urls: $urls)
            LazyVStack(alignment: .leading, spacing: 5) {
                ForEach(urls, id: \.self) { url in
                        Text(url)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .frame(maxWidth : .infinity)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                }
            }
            
                CustomButton(title: "Next") {
                    viewModel.createProduct(title: title, description: description, productType: type, vendor: vendor, imageSources: urls)
                progress = 0.5
                stageNumber = 2
                
            }
        }.padding(.top , 80)
            .padding()
    }
}


struct CustomMenu : View {
    var sentData : [String]
    @State var menuLabel : String
    var textLabel : String
    @Binding var type : String
    var body: some View {
        HStack{
            Text(textLabel)
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundStyle(Color("shopreniaBlue"))
                .frame(maxWidth: .infinity, alignment: .leading)
            Menu {
                ForEach(sentData, id: \.self) { value in
                    Button(value){
                        type = value
                        menuLabel = value
                        print(value)
                    }
                }
            } label: {
                HStack{
                    Text(menuLabel)
                        .font(.system(size: 16, weight: .light, design: .default))
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "chevron.down")
                }
            }
            Spacer()
        }
    }
    
}

struct AddMediaSection : View {
    var viewModel : AddProductViewModel
    @State var mediaUrl: String = ""
    @Binding var urls : [String]
    @State var verifyImage : Bool = false
    var body: some View {
        VStack(alignment: .leading ,spacing : 20){
            Text("Add Media Section : ")
                .foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 28, weight: .medium, design: .default))
            VStack(alignment: .leading){
                CustomTextField(title: "add media url", input: $mediaUrl, width: 300)
                if let url = URL(string: mediaUrl){
                    VerificationImage(url: url)
                }
                Button{
                    if !mediaUrl.isEmpty{
                        urls.append(mediaUrl)
                        mediaUrl = ""
                        verifyImage = true
                    }
                }label: {
                    Text("Add URL")
                    Image(.addCircle)
                }
            }.padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
                .frame(maxWidth: .infinity)
        }
    }
}

struct VerificationImage : View {
    var url : Foundation.URL
    var body: some View {
        AsyncImage(url: url){ phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 150, height: 160)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 160)
                    .clipped()
            case .failure(_):
                Text("Invalid URL Please enter correct one !")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundStyle(.red)
            @unknown default:
                EmptyView()
            }
            
        }
    }
}

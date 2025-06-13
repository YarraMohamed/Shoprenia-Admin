//
//  ProductMainInfoView.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 12/06/2025.
//

import SwiftUI

struct ProductMainInfoView : View {
    var product : ProductEntity
    @Binding var title : String
    @Binding var description : String
    @Binding var type : String
    @Binding var vendor : String
    @State var showAlert : Bool = false
    let productTypes : [String] = ["SHOES","T-SHIRTS","ACCESSORIES"]
    let availableVendors : [String] = ["vans","adidas","nike","converse","puma","asic-tiger","palladium","supra","timberland","dr-martens","herschel","flex-fit"]
    @Binding var urls : [String]
    var body : some View {
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
            MediaSection(urls: $urls)
            LazyVStack(alignment: .leading, spacing: 5) {
                ForEach(urls, id: \.self) { url in
                    HStack{
                        Text(url)
                            .padding(.horizontal)
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
                    }.alert("URL Deletion !", isPresented: $showAlert) {
                        Button("Delete", role: .destructive){
                            urls.removeAll(where: { $0 == url })
                        }
                    }message: {
                        Text("Are you sure you want to delete this url ?")
                    }
                }
        }.padding(.top , 20)
            .padding()
    }
    
}

struct MediaSection : View {
    @State var mediaUrl: String = ""
    @Binding var urls : [String]
    @State var verifyImage : Bool = false
    var body: some View {
        VStack(alignment: .leading){
           Text("Media Section : ")
               .foregroundStyle(Color("shopreniaBlue"))
               .font(.system(size: 28, weight: .medium, design: .default))
       CustomTextField(title: "add media url", input: $mediaUrl, width: 300)
                .frame(maxWidth: .infinity, alignment: .center)
           if let url = URL(string: mediaUrl){
               VerificationImage(url: url)
            }
            HStack {
                Button {
                    if !mediaUrl.isEmpty {
                        urls.append(mediaUrl)
                        mediaUrl = ""
                        verifyImage = true
                    }
                } label: {
                    Text("Add URL")
                    Image(.addCircle)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
       }
       .padding()
       .background(Color.white)
       .cornerRadius(10)
       .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
       .frame(maxWidth: .infinity)
    }
}


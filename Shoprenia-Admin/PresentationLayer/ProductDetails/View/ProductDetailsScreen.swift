//
//  ProductDetails.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 03/06/2025.
//

import SwiftUI
import Shopify
import Foundation

struct ProductDetailsScreen: View {
    var productID : ID
    @Binding var showEditSheet : Bool
    @StateObject var viewModel : ProductDetailsViewModel
    private let reviews = ["1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5"]
    private let numberOfReviews = ["5", "10", "15", "20", "25", "30", "35", "40", "45", "50"]
    @State var selectedSize = "Select size"
    @State var selectedColor = "Select color"
    var body: some View {
        let colorOptions = viewModel.product?.options?.first { $0.name?.lowercased() == "color" }?.optionValues ?? []
        let sizeOptions = viewModel.product?.options?.first(where: {$0.name?.lowercased() == "size"})?.optionValues ?? []
        ScrollView{
            VStack{
                if let imageUrl = viewModel.product?.media?.first?.url{
                    ProductImage(url: URL(string: imageUrl)!)
                }
                HStack{
                    Text(viewModel.product?.title ?? "No Name")
                        .font(.system(size: 20,weight: .semibold))
                        .padding(.leading,16)
                    
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    
                    Text("\(viewModel.product?.variants?.first?.price ?? "0") egp")
                        .foregroundStyle(.blue)
                        .font(.system(size: 16,weight: .semibold))
                        .padding(.trailing,16)
                    
                }
                
                HStack{
                    Image(systemName:"star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                    
                    Text("\(reviews.randomElement() ?? "1")")
                        .font(.system(size: 12,weight: .semibold))
                    
                    Text("(\(numberOfReviews.randomElement() ?? "1") Reviews)")
                        .foregroundStyle(.gray)
                        .font(.system(size: 12,weight: .semibold))
                    
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack{
                    Text("Description")
                        .font(.system(size: 16,weight: .semibold))
                        .padding(16)
                    Spacer()
                }
                
                HStack{
                    ScrollView {
                        Text(viewModel.product?.descriptionHTML ?? "No Description")
                        //.foregroundColor(Color(hex: "4C4B4B"))
                            .padding(.horizontal,16)
                        
                    }
                    Spacer()
                }.frame(height: 100)
                
                HStack{
                    Text("Size")
                        .font(.system(size: 16,weight: .semibold))
                        .padding(16)
                    Spacer()
                }
                
                HStack {
                    Menu {
                        ForEach(sizeOptions,id: \.id) { sizeObj in
                            Button(sizeObj.name ?? "No Size Option") {
                                self.selectedSize = sizeObj.name ?? "No Size"
                            }
                        }
                    } label: {
                        HStack {
                            Text(selectedSize)
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundStyle(.blue)
                        }
                        .padding(15)
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal,16)
                .frame(maxWidth: .infinity)
                
                HStack{
                    Menu {
                        ForEach(colorOptions, id: \.id) { colorObj in
                            Button(colorObj.name ?? "No Color Option") {
                                self.selectedColor = colorObj.name ?? "Unnamed Color"
                            }
                        }
                    } label: {
                        HStack {
                            Text(self.selectedColor)
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundStyle(.blue)
                        }
                        .padding(15)
                        .cornerRadius(8)
                    }
                    
                }.padding(.horizontal,16)
                    .frame(maxWidth: .infinity)
                    .onAppear{
                        viewModel.getProductById(id: productID)
                    }
            }.sheet(isPresented: $showEditSheet) {
                BottomSheetView(showBottomSheet: $showEditSheet)
                    .presentationDetents([.medium])
            }
        }
    }
    init(productID: ID , showEditSheet : Binding<Bool>) {
        self.productID = productID
        _viewModel = StateObject(wrappedValue: ProductDetailsViewModel(usecase: GetProductByIdUsecaseImpl(repository: ProductRepositoryImpl(productRemoteDataSource: ProductRemoteDataSourceImpl(networkService: NetworkServiceImpl.shared)))))
        _showEditSheet = showEditSheet
    }
}





struct ProductImage : View {
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
                Image(.brandImg)
                    .resizable()
                    .scaledToFit()
                    .frame(width:400, height: 160)
                    .clipped()
            @unknown default:
                EmptyView()
            }
            
        }
    }
}





#Preview {
    //BottomSheetView(showBottomSheet : Binding<false>())
}

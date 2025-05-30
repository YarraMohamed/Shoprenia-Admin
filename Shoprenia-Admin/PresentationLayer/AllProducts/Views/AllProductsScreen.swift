//
//  AllProductsScreen.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import SwiftUI

struct AllProductsScreen: View {
    @StateObject var viewModel : AllProductsViewModel
    var coloumns = [GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        VStack{
            Text("All Products")
                .font(.system(size: 36, weight: .medium, design: .default))
                .foregroundColor(.shopreniaBlue)
            if viewModel.products.isEmpty{
                ProgressView()
            }else{
                ScrollView{
                    LazyVGrid(columns: coloumns, spacing: 20){
                        ForEach(viewModel.products , id: \.id){ product in
                            ProductRow(product: product)
                        }
                    }
                }
            }
            
        }.padding()
            .onAppear{
                viewModel.fetchAllProducts()
                print(viewModel.products.count)
            }
    }
    init() {
        _viewModel = StateObject(wrappedValue: AllProductsViewModel(usecase: FetchProductsUsecase(networkService: NetworkService())))
    }
}

#Preview {
    AllProductsScreen()
}

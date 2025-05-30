//
//  HomeScreen.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import SwiftUI
import Shopify

struct HomeScreen: View {
    @StateObject var viewModel : HomeViewModel
    var coloumns = [GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            Text("Brands")
                .font(.system(size: 36, weight: .medium, design: .default))
                .foregroundColor(.shopreniaBlue)
            ScrollView{
                if viewModel.vendors.isEmpty{
                    ProgressView("Loading...")
                        .frame(height: 350)
                }else{
                    LazyVGrid(columns: coloumns,spacing: 24){//2
                        ForEach(viewModel.vendors , id: \.id ){ vendor in
                            VendorsRow(vendor: vendor)
                        }
                    }.padding()
                }
    
            }
        }.onAppear{
            viewModel.getAllVendors()
        }
    }
    init() {
        _viewModel = StateObject(wrappedValue: HomeViewModel(usecase: FetchVendorsUsecase(networkSercive: NetworkService())))
    }
}



#Preview {
    HomeScreen()
}

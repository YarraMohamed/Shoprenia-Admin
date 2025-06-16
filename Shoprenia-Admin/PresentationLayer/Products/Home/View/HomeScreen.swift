//  HomeScreen.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import SwiftUI
import Shopify

struct HomeScreen: View {
    @Binding var path : NavigationPath
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
                            VendorsRow(path: $path,vendor: vendor)
                        }
                    }.padding()
                }
    
            }
        }.onAppear{
            viewModel.getAllVendors()
        }
    }
    init(path : Binding<NavigationPath>) {
        _viewModel = StateObject(
            wrappedValue: HomeViewModel(usecase: FetchAllVendorsUsecaseImpl(repository: ProductRepositoryImpl(productRemoteDataSource: ProductRemoteDataSourceImpl(networkService: NetworkServiceImpl.shared)))) )
        self._path = path
    }
}



#Preview {
    //HomeScreen()
}


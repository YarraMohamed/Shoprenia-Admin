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
            let networkService = NetworkService()
            
//            let product = ProductCreateInput.init(descriptionHtml: nil, handle: nil, seo: nil, productType: "New Shirt", category: nil, tags: ["tag1","tag2","tag3"], templateSuffix: nil, giftCardTemplateSuffix: nil, title: "Raed", vendor: "Adidas", giftCard: nil, collectionsToJoin: nil, combinedListingRole: nil, metafields: nil, productOptions: nil , status: nil, requiresSellingPlan: nil, claimOwnership: nil)
            
//            networkService.createProduct(productInput: product) { result in
//                switch result {
//                case .success(let product):
//                    print(product.title)
//                case .failure(let error):
//                    print(error)
//                }
//            }
        }
    }
    init(path : Binding<NavigationPath>) {
        _viewModel = StateObject(
            wrappedValue: HomeViewModel(
                usecase: FetchVendorsUsecase(
                    networkSercive: NetworkService())))
        self._path = path
    }
}



#Preview {
    //HomeScreen()
}


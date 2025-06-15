//
//  AllProductsScreen.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import SwiftUI
import Shopify
struct AllProductsScreen: View {
    @StateObject var viewModel : AllProductsViewModel
    @Binding var path : NavigationPath
    @State var showAlert : Bool = false
    @State var productToDeleteID : ID = ID.init()
    var vendorName : String?
    var coloumns = [GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack(alignment: .center){
                Text("All Products")
                    .font(.system(size: 36, weight: .medium, design: .default))
                    .foregroundColor(.shopreniaBlue)
                if viewModel.products.isEmpty{
                    ProgressView()
                }else{
                    ScrollView{
                        LazyVGrid(columns: coloumns, spacing: 20){
                            ForEach(viewModel.products , id: \.id){ product in
                                ProductRow( path: $path,product: product,showAlert: $showAlert,productState: $productToDeleteID)
                            }
                        }
                    }.refreshable {
                        if vendorName == nil{
                            viewModel.fetchAllProducts()
                        }else{
                            guard let vendorName = vendorName else{return}
                            viewModel.getVendorProducts(vendorName: vendorName)
                        }
                    }
                }
                
            }
            .padding()
            .alert("Product Deletion !", isPresented: $showAlert) {
                Button("Delete",role: .destructive){
                    print(productToDeleteID)
                    viewModel.deleteProductByID(productID: productToDeleteID)
                    viewModel.products.removeAll(where: {$0.id == productToDeleteID})
                }
            } message: {
                Text("Are you sure you want to delete this product !")
            }.onAppear{
                if vendorName == nil{
                    viewModel.fetchAllProducts()
                }else{
                    guard let vendorName = vendorName else{return}
                    viewModel.getVendorProducts(vendorName: vendorName)
                }
            }
            
        }
    }
    init(path : Binding<NavigationPath>,vendorName : String?) {
            _viewModel = StateObject(
                wrappedValue:
                    AllProductsViewModel(usecase: FetchProductsUsecaseImpl(repository: ProductRepositoryImpl(productRemoteDataSource: ProductRemoteDataSourceImpl(networkService: NetworkServiceImpl.shared))),
                         deleteProductUsecase: DeleteProductUsecaseImpl(repository: ProductRepositoryImpl(productRemoteDataSource:   ProductRemoteDataSourceImpl(networkService: NetworkServiceImpl.shared))),
                                 getVendorProductsUsecase: VectorProductsUsecaseImpl(repository: ProductRepositoryImpl(productRemoteDataSource: ProductRemoteDataSourceImpl(networkService: NetworkServiceImpl.shared)))))
            self._path = path
            self.vendorName = vendorName
        }
    
}

#Preview {
    //AllProductsScreen()
}

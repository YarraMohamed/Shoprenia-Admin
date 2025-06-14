//
//  RootView.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import SwiftUI

struct RootView: View {
    @Binding var path : NavigationPath
    var body: some View {
        TabView{
            HomeScreen(path: $path)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AllProductsScreen(path: $path,vendorName: nil)
                .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        path.append(AppRoute.addProduct)
                    } label: {
                        Image(.addCircle)
                            .font(.title2)
                    }
                }
            }
                .tabItem{
                    Image(.products)
                    Text("Products")
                }
            Coupons()
                .tabItem {
                    Image(.coupons)
                    Text("Coupons")
                }
        }.accentColor(Color("shopreniaBlue"))
    }
}

#Preview {
    //RootView()
}

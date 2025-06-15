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
                .tabItem{
                    Image(.products)
                    Text("Products")
                }
            AllCoupons(path: $path)
                .tabItem {
                    Image(.coupons)
                    Text("Coupons")
                }
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            
                        } label: {
                            Image(.addCircle)
                        }

                    }
                }
        }.accentColor(Color("shopreniaBlue"))
    }
}

#Preview {
    //RootView()
}

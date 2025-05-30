//
//  RootView.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView{
            HomeScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AllProductsScreen()
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
    RootView()
}

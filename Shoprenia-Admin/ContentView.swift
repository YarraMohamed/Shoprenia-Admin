//
//  ContentView.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 27/05/2025.
//

import SwiftUI

struct ContentView: View {
    var networkService = NetworkService()
    var body: some View {

        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            networkService.getAllProducts { result in
                switch result {
                case .success(let products):
                    for product in products {
                        print(product.title)
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

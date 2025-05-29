//
//  ContentView.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 27/05/2025.
//

import SwiftUI

struct ContentView: View {
    var viewModel = ViewModel()
    var body: some View {

        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            viewModel.fetchVendor()
        }
    }
}

#Preview {
    ContentView()
}

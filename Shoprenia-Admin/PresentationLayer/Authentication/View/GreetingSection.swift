//
//  GreetingSection.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import SwiftUI

struct GreetingSection : View {
    var body: some View {
        HStack{
            VStack{
                VStack(alignment : .leading , spacing: 5){ //4
                    Text("Hello, Admin!")
                        .foregroundStyle(Color("shopreniaBlue"))
                        .font(.system(size: 32, weight: .medium, design: .default)) //5
                    
                    Text("Please Login").foregroundStyle(Color("shopreniaBlue"))
                        .font(.system(size: 32, weight: .medium, design: .default)) //6
                }
            }
            Spacer()
        }
    }
}

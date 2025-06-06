//
//  EmailAndPasswordSection.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import SwiftUI

struct EmailAndPasswordSection : View {
    @Binding var email : String
    @Binding var password : String
    var body: some View {
        VStack(spacing : 16){
            VStack(alignment : .leading , spacing: 6){
                Text("Username :")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundStyle(.black)
                
                TextField("Username",text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 45)
            }.padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
            
            VStack(alignment : .leading , spacing : 6){
                Text("Password :")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundStyle(.black)
                
                SecureField("Password",text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height : 45)
                
            }.padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
        }
    }
    
}

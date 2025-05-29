//
//  AuthenticationScreen.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import SwiftUI

struct AuthenticationScreen: View {
    var viewModel : AuthenticationViewModelProtocol = AuthenticationViewModel()
    @State var navigate = false
    var body: some View {
        NavigationView {
            VStack(alignment : .leading, spacing: 10){
                GreetingSection()
                    .padding(.bottom,40)
                EmailAndPasswordSection()
                NavigationLink(destination: HomeScreen(), isActive: $navigate) {
                    Text("Login")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .foregroundStyle(.white)
                        .frame(width: 300, height: 50, alignment: .center)
                        .background(Color("shopreniaBlue"))
                        .cornerRadius(25)
                        .padding()
                        .onTapGesture {
                            
                        }
                }
                Spacer()
            }.padding()
                .navigationTitle("Shoprenia")

        }
    }
}


struct GreetingSection : View {
    var body: some View {
        VStack(alignment : .leading){
            Text("Hello, Admin!")
                .foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 38, weight: .medium, design: .default))
            
            Text("Please Login").foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 38, weight: .medium, design: .default))
        }
    }
}

struct EmailAndPasswordSection : View {
    @State var email : String = ""
    @State var password : String = ""
    var body: some View {
        VStack(alignment : .leading){
            Text("Email :")
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundStyle(.black)
            
            TextField("Email",text: $email)
                .frame(width: 300, height: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
        
        VStack(alignment : .leading){
            Text("Password :")
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundStyle(.black)
            
            
            SecureField("Password",text: $password)
                .frame(width: 300, height: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }.padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
    }
    
}

#Preview {
    AuthenticationScreen()
}

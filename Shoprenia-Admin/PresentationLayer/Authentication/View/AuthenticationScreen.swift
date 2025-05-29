//
//  AuthenticationScreen.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import SwiftUI

struct AuthenticationScreen: View {
    var viewModel : AuthenticationViewModelProtocol = AuthenticationViewModel()
    @State var email : String = ""
    @State var password : String = ""
    @State var showMessage : Bool = false
    @State var shouldNavigate = false
    @State var message : String = ""
    @State var color : Color = Color(.clear)
    var body: some View {
        NavigationStack {
            VStack(alignment : .leading, spacing: 10){
                GreetingSection()
                    .padding(.bottom,40)
                EmailAndPasswordSection(email: $email, password: $password)
                CustomButton(title: "Login") {
                    if viewModel.validatateAdminCredentials(email: email, password: password){
                        message = "Login Successful"
                        color = .green
                        showMessage = true
                        shouldNavigate = true
                    }else{
                        showMessage = true
                        message = "Invalid Credentials"
                        color = .red
                    }
                }.navigationDestination(isPresented: $shouldNavigate) {
                    HomeScreen()
                }
                
                
                Spacer()
            }.padding()
                .navigationTitle("Shoprenia")
            
            if showMessage {
                ShowMessage(color: $color, message: $message)
            }
            
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
    @Binding var email : String
    @Binding var password : String
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

struct CustomButton : View {
    var title : String
    var action : ()->Void
    var body: some View{
        
        Button(title){
            action()
        }
        .font(.system(size: 20, weight: .medium, design: .default))
        .foregroundStyle(.white)
        .frame(width: 300, height: 50, alignment: .center)
        .background(Color("shopreniaBlue"))
        .cornerRadius(25)
        .padding()
    }
}

struct ShowMessage : View {
    @Binding var color : Color
    @Binding var message : String
    var body : some View {
        ZStack{
            Circle()
                .frame(width: 150, height: 150, alignment: .bottom)
                .foregroundStyle(color)
            Text(message)
                .foregroundStyle(.white)
                .font(.system(size: 15, weight: .bold, design: .default))
        }
    }
}


#Preview {
    AuthenticationScreen()
}

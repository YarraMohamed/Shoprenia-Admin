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
    @State var path = NavigationPath()
    @State var message : String = ""
    @State var color : Color = Color(.clear)
    
    var body: some View {
        NavigationStack (path: $path) {
            VStack(spacing: 20){//1
                GreetingSection()
                    .padding(.bottom,20)//2
                EmailAndPasswordSection(email: $email, password: $password)
                CustomButton(title: "Login") {
                    if viewModel.validatateAdminCredentials(email: email, password: password){
                        message = "Login Successful"
                        color = .green
                        showMessage = true
                        path.removeLast(path.count)
                        path.append(AppRoute.rootView)
                    } else {
                        showMessage = true
                        message = "Invalid Credentials"
                        color = .red
                    }
                }
                Spacer()
            }.frame(maxWidth: .infinity, alignment: .center) //3
            .padding()
                .navigationDestination(for : AppRoute.self) { value in
                    switch value{
                    case .rootView :
                        RootView(path: $path)
                            .navigationBarBackButtonHidden(true)
                            .navigationTitle("Shoprenia")
                    case .productDetails(product: let product):
                        Text("Product Details")
                            .navigationTitle("Shoprenia")
                    case .vendorProducts(vendorName: let vendorName):
                        Text("Vendor products")
                            .navigationTitle("Shoprenia")
                    }
                }
                .navigationTitle("Shoprenia")
            if showMessage {
                ShowMessage(color: $color, message: $message)
            }
            
        }
    }
}

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

struct CustomButton : View {
    var title : String
    var action : ()->Void
    var body: some View{
        HStack{
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

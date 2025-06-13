//
//  AuthenticationScreen.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import SwiftUI
import Shopify
struct AuthenticationScreen: View {
    var viewModel : AuthenticationViewModel = AuthenticationViewModel()
    @State var email : String = "Admin"
    @State var password : String = "12345678"
    @State var showMessage : Bool = false
    @State var path = NavigationPath()
    @State var message : String = ""
    @State var color : Color = Color(.clear)
    @State var showingEditSheet : Bool = false
    
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
                    case .productDetails(productID: let productID):
                        ProductDetailsScreen(productID: productID,showEditSheet:$showingEditSheet)
                            .navigationTitle("Shoprenia")
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    HStack(spacing:15){
                                        Button {
                                            showingEditSheet.toggle()
                                        } label: {
                                            Image(.edit)
                                        }
                                        
                                        
                                        Button {
                                            path.append(AppRoute.addProduct)
                                        } label: {
                                            Image(.addCircle)
                                        }
                                        
                                    }
                                }
                            }
                    case .vendorProducts(vendorName: let vendorName):
                        Text("Vendor products")
                            .navigationTitle("Shoprenia")
                    case .addProduct:
                        AddProductScreen()
                    }
                }
                .navigationTitle("Shoprenia")
            if showMessage {
                ShowMessage(color: $color, message: $message)
            }
            
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

//
//  CustomNavigationBar.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 24/06/2025.
//

import SwiftUI

struct CustomNavigationBar: View {
    @Binding var path : NavigationPath
    var showButtomSheet : Binding<Bool>?
    var image : ImageResource
    var showButtons : Bool
    var body: some View {
        HStack{
            Text("Shoprenia")
                .font(.title)
                .fontWeight(.semibold)
                .fontDesign(.serif)
                .foregroundStyle(Color("shopreniaBlue"))
            Spacer()
            HStack(spacing: 20) {
                if showButtons{
                    Button{
                        if image == .addCircle{
                            path.append(AppRoute.addProduct)
                        }else{
                            if let showButtomSheet = showButtomSheet{
                                showButtomSheet.wrappedValue = true
                            }
                        }
                    }label: {
                        Image(image)
                    }
                }
            }
        }.padding()
    }
}

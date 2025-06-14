//
//  BrandRow.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import SwiftUI
import Shopify

struct VendorsRow : View {
    @Binding var path : NavigationPath
    var vendor : GetAllVendorsQuery.Data.Collections.Node?
    var body: some View {
        VStack(spacing : 20){
            if let imageUrl = vendor?.image?.url ,
               let imageUrl = URL(string: imageUrl) {
                VendorImage(imageUrl: imageUrl)
            } else {
                Image(.brandImg)
                    .resizable()
                    .scaledToFit()
                    .frame(width:150, height: 160)
                    .clipped()
            }
            Text(vendor?.handle ?? "NO TITLE")
                .font(.system(size: 28, weight: .medium, design: .default))
                .multilineTextAlignment(.center)
        }.padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
            .onTapGesture {
                print(vendor?.handle ?? "No Value")
                guard let title = vendor?.handle else { return }
                path.append(AppRoute.allProducts(vendorName: title))
            }
        
    }
}

struct VendorImage : View {
    var imageUrl : Foundation.URL
    var body: some View {
        AsyncImage(url: imageUrl) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 150, height: 160)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 160)
                    .clipped()
            case .failure:
                Image(.brandImg)
                    .resizable()
                    .scaledToFit()
                    .frame(width:150, height: 160)
                    .clipped()
            @unknown default:
                EmptyView()
            }
        }
    }
}


#Preview {
    //VendorsRow()
}

//
//  Coupons.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import SwiftUI

struct AllCoupons: View {
    @Binding var path : NavigationPath
    @EnvironmentObject var viewModel : AllCouponsViewModel
    var coloumns = [GridItem(.flexible())]
    var body: some View {
        VStack(spacing : 20){
            Text("Coupons").foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 28, weight: .medium, design: .default))
            List {
                ForEach(viewModel.coupons, id: \.self) { coupon in
                    CouponItem(coupon: coupon)
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.coupons.removeAll { $0.title == coupon.title }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
            }.listStyle(PlainListStyle())
            CustomButton(title: "Add Coupon") {
                path.append(AppRoute.createCoupon)
            }
        }.onAppear {
            viewModel.fetchAllCoupons()
        }.padding()
    }
}


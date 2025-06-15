//
//  Coupons.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 30/05/2025.
//

import SwiftUI
import Shopify

struct AllCoupons: View {
    @Binding var path : NavigationPath
    @EnvironmentObject var viewModel : AllCouponsViewModel
    @State var id : ID = ID()
    @State var showAlert : Bool = false
    var coloumns = [GridItem(.flexible())]
    var body: some View {
        VStack(spacing : 20){
            Text("Coupons").foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 28, weight: .medium, design: .default))
            List {
                ForEach(viewModel.coupons, id: \.self) { coupon in
                    CouponItem(coupon: coupon, id: $id, showAlert: $showAlert)
                }
            }.listStyle(PlainListStyle())
                .alert("Coupon Deletion", isPresented: $showAlert) {
                    Button("Delete",role : .destructive){
                        viewModel.deleteDiscountCodeById(id: id)
                    }
                }message : {
                    Text("Are you sure you want to delete this coupon ?")
                }
            CustomButton(title: "Add Coupon") {
                path.append(AppRoute.createCoupon)
            }
        }.onAppear {
            viewModel.fetchAllCoupons()
        }.padding()
    }
}


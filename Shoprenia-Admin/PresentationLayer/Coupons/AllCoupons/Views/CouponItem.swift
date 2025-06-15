//
//  CouponItem.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import SwiftUI

struct CouponItem: View {
    var coupon: DiscountEntity
    var body: some View {
        VStack(alignment : .leading , spacing: 5){
            CouponTextHStack(text: "Code Title : ", content: coupon.title ?? "No Title")
            CouponTextHStack(text: "Discount Code : ", content: coupon.codes?.first?.code ?? "No Code")
            CouponTextHStack(text: "Start Date : ", content: coupon.startAt ?? "No Start Date")
            CouponTextHStack(text: "Expiration Date : ", content: coupon.endAt ?? "No End Date")
            CouponTextHStack(text: "Discount Summary : ", content: coupon.summary ?? "No Summary Provided")
            if coupon.customerDiscounts?.discountAmount != nil {
                CouponTextHStack(text: "Discount Amount : ", content: String(coupon.customerDiscounts?.discountAmount ?? 0.0) )
            }else{
                CouponTextHStack(text: "Discount Percentage : ", content: String((coupon.customerDiscounts?.discountPercentage ?? 0.0)*100) + "%") 
            }

        }.padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )
    }
}

struct CouponTextHStack : View {
    var text: String
    var content : String
    var body: some View {
        HStack{
            Text(text)
                .foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 16, weight: .medium, design: .default))
            Spacer()
            Text(content)
                .foregroundStyle(.black)
                .font(.system(size: 16, weight: .medium, design: .default))
        }
    }
}

//
//  CreateCoupon.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import SwiftUI

struct CreateCoupon: View {
    @EnvironmentObject var viewModel : CreateCouponViewModel
    @State var couponTitle : String = ""
    @State var startDate : String = ""
    @State var endDate : String = ""
    @State var couponLimit : String = ""
    @State var couponCode : String = ""
    @State var couponPercentage : String? = nil
    @State var minimumSubtotal : String = ""
    var body: some View {
        VStack(alignment : .leading , spacing:20){
            VStack{
                CreateCouponHStack(title: "Coupon Title : ", textFieldTitle: "Title", input: $couponTitle)
                CreateCouponHStack(title: "Start Date : ", textFieldTitle: "Start Date", input: $startDate)
                CreateCouponHStack(title: "End Date : ", textFieldTitle: "End Date", input: $endDate)
                CreateCouponHStack(title: "Usage Limit : ", textFieldTitle: "Limit", input: $couponLimit)
                CreateCouponHStack(title: "Coupon Code : ", textFieldTitle: "Code", input: $couponCode)
                CreateCouponHStack(title: "Minimun Subtotal :", textFieldTitle: "Minimun Subtotal", input: $minimumSubtotal)
                Spacer()
               
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
        CustomButton(title: "Create Coupon") {
            print("Clicked")
            viewModel.createCoupon(coupon: CouponEntity(
                title: couponTitle,
                starstAt: startDate,
                endsAt: endDate,
                usageLimit: Int(couponLimit),
                code: couponCode,
                percentage: 0.1,
                minimumSubtotal: Double(minimumSubtotal),
                )
            )
            
        }
    }
}

#Preview {
    CreateCoupon()
}

struct CreateCouponHStack : View{
    var title : String
    var textFieldTitle : String
    @Binding var input : String
    var body: some View{
        HStack(spacing : 20){
            Text(title).foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 16, weight: .medium, design: .default))
            CustomTextField(title: textFieldTitle, input: $input, width: 250)
        }
    }
}

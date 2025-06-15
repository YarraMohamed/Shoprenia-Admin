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
    @State var selectedType : DiscountType = .fixed
    @State var discountValue : String = ""
    var body: some View {
        VStack(alignment : .leading , spacing:20){
            VStack{
                Text("Coupon Creation")
                CreateCouponHStack(title: "Coupon Title : ", textFieldTitle: "Title", input: $couponTitle)
                CreateCouponHStack(title: "Start Date : ", textFieldTitle: "Start Date", input: $startDate)
                CreateCouponHStack(title: "End Date : ", textFieldTitle: "End Date", input: $endDate)
                CreateCouponHStack(title: "Usage Limit : ", textFieldTitle: "Limit", input: $couponLimit)
                CreateCouponHStack(title: "Coupon Code : ", textFieldTitle: "Code", input: $couponCode)
                CreateCouponHStack(title: "Minimun Subtotal :", textFieldTitle: "Minimun Subtotal", input: $minimumSubtotal)
                CustomPickerView(selectedType: $selectedType)
                switch selectedType {
                case .percentage:
                    CustomDiscoountValueView(discountValue: $discountValue, title: "Percentage Value")
                case .fixed:
                    CustomDiscoountValueView(discountValue: $discountValue, title: "Fixed Value")
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
        CustomButton(title: "Create Coupon") {
            print("Clicked")
            switch selectedType {
            case .fixed:
                viewModel.createFixedDiscountCode(coupon:CouponEntity(
                    title: couponTitle,
                    starstAt: startDate,
                    endsAt: endDate,
                    usageLimit: Int(couponLimit),
                    code: couponCode,
                    percentage: nil,
                    amount: Double(discountValue),
                    minimumSubtotal: Double(minimumSubtotal))
                    )
            case .percentage:
                viewModel.createPercentageDiscountCode(coupon: CouponEntity(
                    title: couponTitle,
                    starstAt: startDate,
                    endsAt: endDate,
                    usageLimit: Int(couponLimit),
                    code: couponCode,
                    percentage: Double(discountValue),
                    minimumSubtotal: Double(minimumSubtotal)
                    )
                )
            }
            
            
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
            Spacer()
            CustomTextField(title: textFieldTitle, input: $input, width: 200)
        }
    }
}

struct CustomPickerView : View {
    @Binding var selectedType : DiscountType
    var body: some View {
        HStack(spacing : 20){
            Text("Discount Type :").foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 16, weight: .medium, design: .default))
            Spacer()
            Picker("Select Option", selection: $selectedType) {
                ForEach(DiscountType.allCases , id:\.self){ value in
                    Text(value.rawValue).tag(value)
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding()
        }
    }
}

enum DiscountType : String, Hashable, CaseIterable {
    case fixed = "Fixed"
    case percentage = "Percentage"
}

struct CustomDiscoountValueView : View {
    @Binding var discountValue : String
    var title : String
    var body: some View {
        HStack{
            Text("Discount Value :").foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 16, weight: .medium, design: .default))
            Spacer()
            CustomTextField(title: title, input: $discountValue, width: 200)
        }
    }
}

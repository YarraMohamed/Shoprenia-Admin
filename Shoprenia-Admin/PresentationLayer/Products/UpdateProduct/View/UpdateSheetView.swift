//
//  BottomSheetView.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 04/06/2025.
//

import SwiftUI
import Shopify

struct UpdateSheetView : View {
    @State var title : String
    @State var description : String
    @State var productType : String
    @State var vendor : String
    @State var urls : [String]
    @State var initialColor: String
    @State var initialSize: String
    @State var initialPrice:String
    @State var initialQuantity: String
    @State var variants : [VariantModel]
    @EnvironmentObject var viewModel : UpdateProductViewModel
    var product : ProductEntity
    @Binding var showBottomSheet : Bool
    @State var selectedTab : Tabs = .MainInfo
    var body: some View {
        VStack(spacing : 10){
            Picker("Select Section", selection: $selectedTab) {
                ForEach(Tabs.allCases, id: \.id) { tab in
                    Text(tab.rawValue).tag(tab)
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.top,40)
                .padding(.horizontal,20)
            ScrollView{
                switch selectedTab {
                case .MainInfo:
                    ProductMainInfoView(product:product, title:$title, description:$description, type:$productType, vendor:$vendor,urls: $urls)
                case .Options:
                    ProductOptionView(product: product,initialColor: $initialColor,initialSize: $initialSize,initialPrice: $initialPrice,initialQuantity: $initialQuantity)
                case .Variants:
                    ProductVariantView(product: product,variants: $variants)
                }
            }.onAppear{
                print(product.media ?? [])
            }
            .padding()
            CustomButton(title: "Save and Update") {
                guard let productID = product.id else{return}
                viewModel.updateProduct(
                    oldProductID: productID,
                    title: title,
                    description: description,
                    productType: productType,
                    vendor: vendor,
                    urls: urls,
                    initialColor: initialColor,
                    initialSize: initialSize,
                    initialPrice:initialPrice,
                    initialQuantity: initialQuantity,
                    variants: variants
                )
                if viewModel.finish{
                    showBottomSheet = false
                }
            }
        }
    }
    init(product : ProductEntity,showBottomSheet : Binding<Bool>){
        self.product = product
        title = product.title ?? ""
        description = product.descriptionHTML ?? ""
        productType = product.productType ?? ""
        vendor = product.vendor ?? ""
        urls = product.media?.map{
            $0.originalSource ?? ""
        } ?? []
        initialColor = product.options?.first(where: {$0.name == "Color"})?.optionValues?.first?.name ?? "No Intial Color"
        initialSize = product.options?.first(where: {$0.name == "Size"})?.optionValues?.first?.name ?? "No Intial Size"
        initialPrice = product.variants?.first?.price ?? "No Intial Price"
        initialQuantity = String(product.variants?.first?.inventoryQuantity ?? 0)
        variants = product.variants?.map{$0.toVariantModel()} ?? []
        self._showBottomSheet = showBottomSheet
    }
}


struct CustomTextField : View {
    var title : String
    @Binding var input : String
    var width : CGFloat
    var body: some View {
        TextField(title,text : $input)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: width,height: 45)
    }
}

enum Tabs : String , Identifiable , CaseIterable {
    case MainInfo = "Main Info"
    case Options = "Options"
    case Variants = "Variants"
    var id : String { self.rawValue }
}

struct DescriptionInputView: View {
    @Binding var description : String
    var body: some View {
        VStack(alignment: .leading) {
            TextEditor(text: $description)
                .padding()
                .frame(height: 250)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
        }
        .padding()
    }
}

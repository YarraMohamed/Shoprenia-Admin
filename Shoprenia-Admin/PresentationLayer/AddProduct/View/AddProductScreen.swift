//
//  AddProductScreen.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 06/06/2025.
//

import SwiftUI
import Shopify
struct AddProductScreen: View {
    @EnvironmentObject var viewModel : AddProductViewModel
    @State private var progress: Double = 0.25
    @State private var stageNumber = 1
    var body: some View {
        VStack{
            switch viewModel.creationStages {
                
            case .firstStage:
                FirstStageView(progress : $progress , stageNumber: $stageNumber, viewModel : viewModel)
            case .secondStage(_):
                SecondStageView(viewModel: viewModel, progress: $progress, stageNumber: $stageNumber)
            case .thirdStage(_, let options):
                ThirdStageView(viewModel: viewModel, progress: $progress, stageNumber: $stageNumber, options: options)
                
            case .forthStage(_):
                Text("Hello")
                
            }
            Spacer()
            VStack(alignment : .center, spacing : 20){
                ProgressView(value: progress , total: 1)
                    .frame(width: 250, height: 10, alignment: .center)
                    .accentColor(Color("shopreniaBlue"))
                Text("Step : \(stageNumber)")
            }
            
        }.onAppear {
            viewModel.creationStages = .firstStage
            stageNumber = 1
        }
    }
    
}

struct VariantModel: Hashable {
    let color : String
    let size : String
    let quantity : Int
    let price : Double
}

struct ThirdStageView : View {
    var viewModel : AddProductViewModel
    @State var color : String = ""
    @State var size : String = ""
    @State var price : String = ""
    @State var quantity : String = ""
    
    @State var variants : [VariantModel] = []
    
    @State var colorOption : CreateProductOptionsMutation.Data.ProductOptionsCreate.Product.Option?
    @State var sizeOption : CreateProductOptionsMutation.Data.ProductOptionsCreate.Product.Option?
    
    @Binding var progress: Double
    @Binding var stageNumber: Int
    @State var showError : Bool = false
    
    let options : [CreateProductOptionsMutation.Data.ProductOptionsCreate.Product.Option]
    
    var body: some View{
        VStack(spacing : 20){
            Text("Add Variants ")
                .foregroundStyle(Color("shopreniaBlue"))
                .font(.system(size: 28, weight: .medium, design: .default))
            VStack{
                VStack(alignment : .leading, spacing : 20){
                    HStack(spacing : 20){
//                        Text("Add Color").foregroundStyle(Color("shopreniaBlue"))
//                            .font(.system(size: 20, weight: .medium, design: .default))
                        if let colorOption = options.first(where: { $0.name == "Color" }) {
                            Menu {
                                ForEach(colorOption.values, id: \.self) { value in
                                    Button(value){
                                        color = value
                                    }
                                }
                            } label: {
                                HStack{
                                    Text("Choose Size")
                                    Image(systemName: "chevron.down")
                                }
                            }

                        }
                        
                    }
                    HStack(spacing : 20){
//                        Text("Add Size").foregroundStyle(Color("shopreniaBlue"))
//                            .font(.system(size: 20, weight: .medium, design: .default))
                        //CustomTextField(title: "Add Size", input: $size, width: 200)
                        if let sizeOptions = options.first(where: { $0.name == "Size" }) {
                            Menu {
                                ForEach(sizeOptions.values, id: \.self) { value in
                                    Button(value){
                                        size = value
                                    }
                                }
                            } label: {
                                HStack{
                                    Text("Choose Color")
                                    Image(systemName: "chevron.down")
                                }
                            }

                        }
                    }
                    HStack(spacing : 20){
                        Text("Variant Price").foregroundStyle(Color("shopreniaBlue"))
                            .font(.system(size: 20, weight: .medium, design: .default))
                        CustomTextField(title: "Price", input: $price, width: 200)
                    }
                    HStack(spacing : 20){
                        Text("Variant Quantity").foregroundStyle(Color("shopreniaBlue"))
                            .font(.system(size: 20, weight: .medium, design: .default))
                        CustomTextField(title: "Quantity", input: $quantity, width: 200)
                    }
                }
                Button {
                    if !color.isEmpty && !size.isEmpty && !price.isEmpty && !quantity.isEmpty {
                        let variant = VariantModel(color: color, size: size, quantity: Int(quantity)!, price: Double(price)!)
                        showError = false
                        variants.append(variant)
                        color = ""
                        size = ""
                        price = ""
                        quantity = ""
                    }else{
                        showError = true
                    }
                   
                } label: {
                    Text("Add Variant")
                    Image(.addCircle)
                }
            }.padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
                .frame(maxWidth: .infinity)
            if showError{
                Text("Please Complete all Fields To Add Variant !")
                    .foregroundStyle(.red)
                    .font(.system(size: 22, weight: .medium, design: .default))
            }else{
                List{
                    ForEach(variants, id: \.self){ variant in
                        VStack {
                            HStack{
                                Text("Variant").foregroundStyle(Color("shopreniaBlue"))
                                Spacer()
                                Text("\(variant.color) / \(variant.size)")
                            }
                            HStack {
                                Text("Quantity").foregroundStyle(Color("shopreniaBlue"))
                                Spacer()
                                Text("\(variant.quantity)")
                            }
                            HStack {
                                Text("Price").foregroundStyle(Color("shopreniaBlue"))
                                Spacer()
                                Text(String(format: "EGP %.2f", variant.price))
                            }
                        }
                    }
                }
            }
            
            CustomButton(title: "Next") {
                
                let variantDTOs = variants.map { dto in
                    ProductVariantsBulkInput(
                        inventoryQuantities: [
                            InventoryLevelInput(availableQuantity: dto.quantity, locationId : "")
                        ],optionValues: [
                            VariantOptionValueInput(name: GraphQLNullable.some(dto.color), optionName: "Color"),
                            VariantOptionValueInput(name: GraphQLNullable.some(dto.size), optionName: "Size")
                        ], price: GraphQLNullable.some(String(format: "%.2f", dto.price))
                    )
                }
                viewModel.createProductVariants(id: viewModel.productID, variants: variantDTOs)
                viewModel.creationStages = .forthStage(id: viewModel.productID)
                progress = 1
                stageNumber = 4
            }
        }.padding(.top , 30)
            .padding()
    }
}


#Preview {
    AddProductScreen()
        .environmentObject(AddProductViewModel(
            createProductUseCase: CreateProductUsecase(networkService: NetworkService()),
            createProductOptionsUseCase: CreateProductOptionsUsecase(networkService: NetworkService()),
            createProductMediaUseCase: CreateProductMediaUsecase(networkService: NetworkService()), createProductVariantUseCase: CreateProductVariantsUsecase(networkService: NetworkService())))
}

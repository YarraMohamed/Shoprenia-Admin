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
            case .secondStage:
                SecondStageView(viewModel: viewModel, progress: $progress, stageNumber: $stageNumber)
            case .thirdStage :
                ThirdStageView(viewModel: viewModel, progress: $progress, stageNumber: $stageNumber)
                
            case .forthStage:
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




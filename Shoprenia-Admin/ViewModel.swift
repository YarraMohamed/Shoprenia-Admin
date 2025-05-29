//
//  ViewModel.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//

import Apollo
import Foundation
import Shopify

class ViewModel {
    
//    func getAllProducts() {
//        NetworkService.shared.apollo.fetch(query: GetProductsQuery()){ result in
//            switch result {
//            case .success(let graphQLResult):
//                if let data = graphQLResult.data {
//                    let productEdges = data.products.edges
//                    for edge in productEdges {
//                        let product = edge.node
//                        print("Product id: \(product.id)")
//                        print("Product Title: \(product.title)")
//                    }
//                } else if let errors = graphQLResult.errors {
//                    print("GraphQL errors: \(errors)")
//                }
//            case .failure(let error):
//                print("Network or decoding error: \(error)")
//            }
//        }
//    }
//    
//    func getAllVendorsName(){
//        NetworkService.shared.apollo.fetch(query: GetVendorsQuery()){ result in
//            switch result {
//            case .success(let graphQLResult) :
//                if let data = graphQLResult.data {
//                    data.productVendors?.nodes.forEach { node in
//                        print("vender: \t \(node)")
//                    }
//                }
//            case .failure(let error) :
//                print("Error : \t \(error)")
//            }
//        }
//    }
}

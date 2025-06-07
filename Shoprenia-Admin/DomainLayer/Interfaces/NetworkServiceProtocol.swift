//
//  NetworkServiceProtocol.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 29/05/2025.
//


import Foundation
import Shopify

protocol NetworkServiceProtocol {
    func getAllVendors(completionHandler : @escaping (Result<[GetAllVendorsQuery.Data.Collections.Node],Error>)->Void)
    func getAllProducts(completionHandler : @escaping (Result<[GetProductsQuery.Data.Products.Node],Error>)->Void)
    func getVendorProducts(vendorName : String ,completionHandler : @escaping (Result<[GetVendorProductsQuery.Data.Products.Node],Error>) ->Void)
    func getProductByID(productID : ID ,completionHandler: @escaping (Result<GetProductByIDQuery.Data.Product,Error>)->Void)
    
    func createProduct(title : String, description : String, productType : String, vendor : String, completionHandler : @escaping (Result<ID,Error>)->Void)
    
    func createProductOptions(id : ID, productOptions : [OptionCreateInput] ,completionHandler : @escaping (Result<[CreateProductOptionsMutation.Data.ProductOptionsCreate.Product.Option],Error>)->Void)
    
    func createProductMedia(id : ID, media : [CreateMediaInput], completionHandler : @escaping (Result<Bool,Error>)->Void)
    
    func createProductVariants(id : ID , variants : [ProductVariantsBulkInput] , completionHandler : @escaping (Result<Bool,Error>)->Void)
    
    func deleteProductByID(id : ID , completionHandler : @escaping (Result<Bool,Error>)->Void)
}

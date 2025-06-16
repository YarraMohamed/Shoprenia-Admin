//
//  CopounsDataSourceImpl.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation
import Apollo
import Shopify

class CouponsDataSourceImpl : CouponsDataSource {
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getAllCoupons(completionHandler: @escaping (Result<[DiscountEntity], any Error>) -> Void) {
        networkService.queryRequest(query: GetAllCouponsQuery()) { result in
            switch result {
            case .success(let graphQlResult):
                if let coupons = graphQlResult.data?.discountNodes.nodes{
                    let entity = coupons.map{$0.toDomainModel()}
                    completionHandler(.success(entity))
                }else{
                    completionHandler(.failure(NSError(domain: "No Coupons Found", code: 404)))
                }
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    func createPercentageDiscountCode(coupon: CouponEntity, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        let mutation = CreatePercentageDiscountCodeMutation(
            title: coupon.title ?? "", startsAt: coupon.starstAt ?? "NO Start date",
            endsAt: coupon.endsAt ?? "No end date",
            usageLimit: GraphQLNullable<Int>.some(coupon.usageLimit ?? 0)
            , code: coupon.code ?? "", percentage: coupon.percentage ?? 0
            , appliesOncePerCustomer: true, minSubtotal: GraphQLNullable<String>.some(coupon.minimumSubtotal?.formatted() ?? "0"))
        networkService.mutaionRequest(mutation: mutation) { result in
                switch result {
                case .success(let graphQLResult):
                    if let graphQLResult = graphQLResult.data?.discountCodeBasicCreate?.codeDiscountNode?.codeDiscount.asDiscountCodeBasic{
                        print(graphQLResult)
                        completionHandler(.success(true))
                    }else{
                        let message = graphQLResult.data?.discountCodeBasicCreate?.userErrors.first?.message
                        print(message ?? "Ambigous Error Message")
                        completionHandler(.failure(NSError(domain: message ?? "No Error Found", code: 404)))
                    }
                case .failure(let failure):
                    completionHandler(.failure(failure))
                }
            }
    }
    func createFixedDiscountCode(coupon : CouponEntity, completionHandler: @escaping (Result<Bool,Error>)->Void){
        let mutation = CreateFixedDiscountCodeMutation(
            title: coupon.title ?? "", startsAt: coupon.starstAt ?? "NO Start date",
            endsAt: coupon.endsAt ?? "No end date",
            usageLimit: coupon.usageLimit ?? 0 ,
            code:  coupon.code ?? "",
            discountAmount: String(coupon.amount ?? 0),
            minimumSubtotal: String(coupon.minimumSubtotal ?? 0)
        )
        networkService.mutaionRequest(mutation: mutation) { result in
                switch result {
                case .success(let graphQLResult):
                    if let graphQLResult = graphQLResult.data?.discountCodeBasicCreate?.codeDiscountNode?.codeDiscount.asDiscountCodeBasic{
                        print(graphQLResult)
                        completionHandler(.success(true))
                    }else{
                        let message = graphQLResult.data?.discountCodeBasicCreate?.userErrors.first?.message
                        print(message ?? "Ambigous Error Message")
                        completionHandler(.failure(NSError(domain: message ?? "No Error Found", code: 404)))
                    }
                case .failure(let failure):
                    completionHandler(.failure(failure))
                }
            }
    }
    
    func deleteDiscountCodeById(id: ID, completionHandler: @escaping (Result<Bool, any Error>) -> Void) {
        networkService.mutaionRequest(mutation: DeleteDiscountCodeMutation(ids: [id])) { result in
            switch result {
            case .success(let graphQLResult):
                if (graphQLResult.data?.discountCodeBulkDelete) != nil{
                    completionHandler(.success(true))
                }else{
                    let message = graphQLResult.data?.discountCodeBulkDelete?.userErrors.first?.message
                    completionHandler(.failure(NSError(domain: message ?? "Ambigous error", code: 404)))
                }
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
}

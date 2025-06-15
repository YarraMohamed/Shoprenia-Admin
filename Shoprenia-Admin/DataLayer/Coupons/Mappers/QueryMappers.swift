//
//  MutationMappers.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation
import Shopify
import Apollo

extension GetAllCouponsQuery.Data.DiscountNodes.Node{
    func toDomainModel()->DiscountEntity{
        let codes = self.discount.asDiscountCodeBasic?.codes.nodes
        let summary = self.discount.asDiscountCodeBasic?.summary
        let title = self.discount.asDiscountCodeBasic?.title
        let status = self.discount.asDiscountCodeBasic?.status
        let startAt = self.discount.asDiscountCodeBasic?.startsAt
        let endAt = self.discount.asDiscountCodeBasic?.endsAt
        let asyncUsageCount = self.discount.asDiscountCodeBasic?.asyncUsageCount
        let customerDiscounts = self.discount.asDiscountCodeBasic?.customerGets
        return DiscountEntity(
            codes: codes?.map{$0.toDomainModel()},
            summary: summary,
            title: title,
            status: status?.toDomainModel(),
            startAt: startAt,
            endAt: endAt,
            asyncUsageCount: asyncUsageCount,
            customerDiscounts: customerDiscounts?.toDomainModel()
        )
    }
}

extension GetAllCouponsQuery.Data.DiscountNodes.Node.Discount.AsDiscountCodeBasic.Codes.Node{
    func toDomainModel()-> Code{
        return Code(code: self.code, id: self.id)
    }
}

extension GraphQLEnum {
    func toDomainModel() -> DiscountStatusEntity{
        return DiscountStatusEntity.init(rawValue: self.rawValue) ?? .active
    }
}

extension GetAllCouponsQuery.Data.DiscountNodes.Node.Discount.AsDiscountCodeBasic.CustomerGets{
    func toDomainModel()-> CustomerDiscountResult{
        let amount = self.value.asDiscountAmount?.amount.amount
        let percentage = self.value.asDiscountPercentage?.percentage
        return CustomerDiscountResult(
            discountPercentage: percentage,
            discountAmount: amount != nil ? Double(amount!) : nil
        )
    }
}


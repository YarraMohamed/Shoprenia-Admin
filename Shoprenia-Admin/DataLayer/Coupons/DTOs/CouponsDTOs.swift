//
//  DTOs.swift
//  Shoprenia-Admin
//
//  Created by Abdullah Raed on 14/06/2025.
//

import Foundation


struct DiscountEntity : Codable , Hashable {
    var id : String? = nil
    var codes : [Code]? = nil
    var summary : String? = nil
    var title : String? = nil
    var status : DiscountStatusEntity? = nil
    var startAt : String? = nil
    var endAt : String? = nil
    var asyncUsageCount : Int? = nil
    var customerDiscounts : CustomerDiscountResult? = nil
}

struct Code : Codable ,Hashable , Identifiable{
    var code : String? = nil
    var id : String? = nil
}

public enum DiscountStatusEntity: String, Codable , Hashable {
  case active = "ACTIVE"
  case expired = "EXPIRED"
  case scheduled = "SCHEDULED"
}

struct CustomerDiscountResult : Codable , Hashable {
    var discountPercentage : Double? = nil
    var discountAmount : Double? = nil
}

struct CouponEntity : Codable , Hashable {
    var title : String? = nil
    var starstAt : String? = nil
    var endsAt : String? = nil
    var usageLimit : Int? = nil
    var code : String? = nil
    var percentage : Double? = nil
    var amount : Double? = nil
    var minimumSubtotal : Double? = nil
    var appliesOncePerCustomer : Bool? = true
}

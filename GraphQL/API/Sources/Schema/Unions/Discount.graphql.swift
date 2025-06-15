// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Unions {
  /// A discount.
  static let Discount = Union(
    name: "Discount",
    possibleTypes: [
      Objects.DiscountAutomaticApp.self,
      Objects.DiscountAutomaticBasic.self,
      Objects.DiscountAutomaticBxgy.self,
      Objects.DiscountAutomaticFreeShipping.self,
      Objects.DiscountCodeApp.self,
      Objects.DiscountCodeBasic.self,
      Objects.DiscountCodeBxgy.self,
      Objects.DiscountCodeFreeShipping.self
    ]
  )
}
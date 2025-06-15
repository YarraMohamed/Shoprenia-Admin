// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Unions {
  /// The type of discount associated with the discount code. For example, the discount code might offer a basic discount of a fixed percentage, or a fixed amount, on specific products or the order. Alternatively, the discount might offer the customer free shipping on their order. A third option is a Buy X, Get Y (BXGY) discount, which offers a customer discounts on select products if they add a specific product to their order.
  static let DiscountCode = Union(
    name: "DiscountCode",
    possibleTypes: [
      Objects.DiscountCodeApp.self,
      Objects.DiscountCodeBasic.self,
      Objects.DiscountCodeBxgy.self,
      Objects.DiscountCodeFreeShipping.self
    ]
  )
}
// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Unions {
  /// The type of the discount value and how it will be applied. For example, it might be a percentage discount on a fixed number of items. Alternatively, it might be a fixed amount evenly distributed across all items or on each individual item. A third example is a percentage discount on all items.
  static let DiscountCustomerGetsValue = Union(
    name: "DiscountCustomerGetsValue",
    possibleTypes: [
      Objects.DiscountAmount.self,
      Objects.DiscountOnQuantity.self,
      Objects.DiscountPercentage.self
    ]
  )
}
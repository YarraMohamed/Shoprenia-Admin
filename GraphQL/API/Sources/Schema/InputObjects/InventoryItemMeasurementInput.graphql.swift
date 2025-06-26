// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for an inventory item measurement.
public struct InventoryItemMeasurementInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    weight: GraphQLNullable<WeightInput> = nil
  ) {
    __data = InputDict([
      "weight": weight
    ])
  }

  /// The weight of the inventory item.
  public var weight: GraphQLNullable<WeightInput> {
    get { __data["weight"] }
    set { __data["weight"] = newValue }
  }
}

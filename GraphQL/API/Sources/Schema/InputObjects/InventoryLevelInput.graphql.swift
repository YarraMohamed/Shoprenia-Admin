// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for an inventory level.
public struct InventoryLevelInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    availableQuantity: Int,
    locationId: ID
  ) {
    __data = InputDict([
      "availableQuantity": availableQuantity,
      "locationId": locationId
    ])
  }

  /// The available quantity of an inventory item at a location.
  public var availableQuantity: Int {
    get { __data["availableQuantity"] }
    set { __data["availableQuantity"] = newValue }
  }

  /// The ID of a location associated with the inventory level.
  public var locationId: ID {
    get { __data["locationId"] }
    set { __data["locationId"] = newValue }
  }
}

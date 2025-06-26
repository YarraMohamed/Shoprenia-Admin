// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for the quantity to be set for an inventory item at a location.
public struct InventoryQuantityInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    inventoryItemId: ID,
    locationId: ID,
    quantity: Int,
    compareQuantity: GraphQLNullable<Int> = nil
  ) {
    __data = InputDict([
      "inventoryItemId": inventoryItemId,
      "locationId": locationId,
      "quantity": quantity,
      "compareQuantity": compareQuantity
    ])
  }

  /// Specifies the inventory item to which the quantity will be set.
  public var inventoryItemId: ID {
    get { __data["inventoryItemId"] }
    set { __data["inventoryItemId"] = newValue }
  }

  /// Specifies the location at which the quantity will be set.
  public var locationId: ID {
    get { __data["locationId"] }
    set { __data["locationId"] = newValue }
  }

  /// The quantity to which the inventory quantity will be set.
  public var quantity: Int {
    get { __data["quantity"] }
    set { __data["quantity"] = newValue }
  }

  /// The current quantity to be compared against the persisted quantity.
  public var compareQuantity: GraphQLNullable<Int> {
    get { __data["compareQuantity"] }
    set { __data["compareQuantity"] = newValue }
  }
}

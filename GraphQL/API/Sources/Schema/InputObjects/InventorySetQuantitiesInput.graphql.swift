// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields required to set inventory quantities.
public struct InventorySetQuantitiesInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    reason: String,
    name: String,
    referenceDocumentUri: GraphQLNullable<String> = nil,
    quantities: [InventoryQuantityInput],
    ignoreCompareQuantity: GraphQLNullable<Bool> = nil
  ) {
    __data = InputDict([
      "reason": reason,
      "name": name,
      "referenceDocumentUri": referenceDocumentUri,
      "quantities": quantities,
      "ignoreCompareQuantity": ignoreCompareQuantity
    ])
  }

  /// The reason for the quantity changes. The value must be one of the [possible
  /// reasons](https://shopify.dev/docs/apps/fulfillment/inventory-management-apps/quantities-states#set-inventory-quantities-on-hand).
  public var reason: String {
    get { __data["reason"] }
    set { __data["reason"] = newValue }
  }

  /// The name of quantities to be changed. The only accepted values are: `available` or `on_hand`.
  public var name: String {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  /// A freeform URI that represents why the inventory change happened. This can be the entity adjusting inventory
  /// quantities or the Shopify resource that's associated with the inventory adjustment. For example, a unit in a
  /// draft order might have been previously reserved, and a merchant later creates an order from the draft order.
  /// In this case, the `referenceDocumentUri` for the inventory adjustment is a URI referencing the order ID.
  public var referenceDocumentUri: GraphQLNullable<String> {
    get { __data["referenceDocumentUri"] }
    set { __data["referenceDocumentUri"] = newValue }
  }

  /// The values to which each quantities will be set.
  public var quantities: [InventoryQuantityInput] {
    get { __data["quantities"] }
    set { __data["quantities"] = newValue }
  }

  /// Skip the compare quantity check in the quantities field.
  public var ignoreCompareQuantity: GraphQLNullable<Bool> {
    get { __data["ignoreCompareQuantity"] }
    set { __data["ignoreCompareQuantity"] = newValue }
  }
}

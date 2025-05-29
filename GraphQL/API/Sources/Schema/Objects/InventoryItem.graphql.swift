// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// Represents the goods available to be shipped to a customer.
  /// It holds essential information about the goods, including SKU and whether it is tracked.
  /// Learn [more about the relationships between inventory objects](https://shopify.dev/docs/apps/build/orders-fulfillment/inventory-management-apps/manage-quantities-states#inventory-object-relationships).
  static let InventoryItem = ApolloAPI.Object(
    typename: "InventoryItem",
    implementedInterfaces: [
      Interfaces.LegacyInteroperability.self,
      Interfaces.Node.self
    ],
    keyFields: nil
  )
}
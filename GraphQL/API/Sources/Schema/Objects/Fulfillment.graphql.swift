// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// Represents a fulfillment.
  /// In Shopify, a fulfillment represents a shipment of one or more items in an order.
  /// When an order has been completely fulfilled, it means that all the items that are included
  /// in the order have been sent to the customer.
  /// There can be more than one fulfillment for an order.
  static let Fulfillment = ApolloAPI.Object(
    typename: "Fulfillment",
    implementedInterfaces: [
      Interfaces.LegacyInteroperability.self,
      Interfaces.Node.self
    ],
    keyFields: nil
  )
}
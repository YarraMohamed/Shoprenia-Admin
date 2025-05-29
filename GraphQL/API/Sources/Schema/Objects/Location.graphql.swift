// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// Represents the location where the physical good resides. You can stock inventory at active locations. Active
  /// locations that have `fulfills_online_orders: true` and are configured with a shipping rate, pickup enabled or
  /// local delivery will be able to sell from their storefront.
  static let Location = ApolloAPI.Object(
    typename: "Location",
    implementedInterfaces: [
      Interfaces.HasMetafieldDefinitions.self,
      Interfaces.HasMetafields.self,
      Interfaces.LegacyInteroperability.self,
      Interfaces.Node.self
    ],
    keyFields: nil
  )
}
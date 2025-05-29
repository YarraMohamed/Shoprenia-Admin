// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// Price rules are a set of conditions, including entitlements and prerequisites, that must be met in order for a discount code to apply.
  ///
  /// We recommend using the types and queries detailed at [Getting started with discounts](https://shopify.dev/docs/apps/selling-strategies/discounts/getting-started) instead. These will replace the GraphQL `PriceRule` object and REST Admin `PriceRule` and `DiscountCode` resources.
  static let PriceRule = ApolloAPI.Object(
    typename: "PriceRule",
    implementedInterfaces: [
      Interfaces.CommentEventSubject.self,
      Interfaces.HasEvents.self,
      Interfaces.LegacyInteroperability.self,
      Interfaces.Node.self
    ],
    keyFields: nil
  )
}
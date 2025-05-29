// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// A store credit account contains a monetary balance that can be redeemed at checkout for purchases in the shop.
  /// The account is held in the specified currency and has an owner that cannot be transferred.
  ///
  /// The account balance is redeemable at checkout only when the owner is authenticated via [new customer accounts authentication](https://shopify.dev/docs/api/customer).
  static let StoreCreditAccount = ApolloAPI.Object(
    typename: "StoreCreditAccount",
    implementedInterfaces: [Interfaces.Node.self],
    keyFields: nil
  )
}
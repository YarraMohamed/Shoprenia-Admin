// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// Balance and payout information for a
  /// [Shopify Payments](https://help.shopify.com/manual/payments/shopify-payments/getting-paid-with-shopify-payments)
  /// account. Balance includes all balances for the currencies supported by the shop.
  /// You can also query for a list of payouts, where each payout includes the corresponding currencyCode field.
  static let ShopifyPaymentsAccount = ApolloAPI.Object(
    typename: "ShopifyPaymentsAccount",
    implementedInterfaces: [Interfaces.Node.self],
    keyFields: nil
  )
}
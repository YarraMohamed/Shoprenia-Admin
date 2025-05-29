// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Interfaces {
  /// Interoperability metadata for types that directly correspond to a REST Admin API resource.
  /// For example, on the Product type, LegacyInteroperability returns metadata for the corresponding [Product object](https://shopify.dev/api/admin-graphql/latest/objects/product) in the REST Admin API.
  static let LegacyInteroperability = ApolloAPI.Interface(
    name: "LegacyInteroperability",
    keyFields: nil,
    implementingObjects: [
      "Customer",
      "DraftOrder",
      "Fulfillment",
      "InventoryItem",
      "Location",
      "MarketingEvent",
      "Metafield",
      "Order",
      "PriceRule",
      "Product",
      "ProductVariant",
      "Refund",
      "SavedSearch",
      "ScriptTag",
      "ShopifyPaymentsDispute",
      "ShopifyPaymentsPayout",
      "WebhookSubscription"
    ]
  )
}
// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// The `LineItem` object represents a single product or service that a customer purchased in an
  /// [order](https://shopify.dev/docs/api/admin-graphql/latest/objects/Order).
  /// Each line item is associated with a
  /// [product variant](https://shopify.dev/docs/api/admin-graphql/latest/objects/ProductVariant)
  /// and can have multiple [discount allocations](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountAllocation).
  /// Line items contain details about what was purchased, including the product variant, quantity, pricing,
  /// and fulfillment status.
  ///
  /// Use the `LineItem` object to manage the following processes:
  ///
  /// - [Track the quantity of items](https://shopify.dev/docs/apps/build/orders-fulfillment/order-management-apps/build-fulfillment-solutions) ordered, fulfilled, and unfulfilled.
  /// - [Calculate prices](https://shopify.dev/docs/apps/build/orders-fulfillment/order-management-apps/edit-orders), including discounts and taxes.
  /// - Manage fulfillment through [fulfillment services](https://shopify.dev/docs/apps/build/orders-fulfillment/fulfillment-service-apps).
  /// - Manage [returns](https://shopify.dev/docs/apps/build/orders-fulfillment/returns-apps/build-return-management) and [exchanges](https://shopify.dev/docs/apps/build/orders-fulfillment/returns-apps/manage-exchanges).
  /// - Handle [subscriptions](https://shopify.dev/docs/apps/build/purchase-options/subscriptions) and recurring orders.
  ///
  /// Line items can also include custom attributes and properties, allowing merchants to add specific details
  /// about each item in an order. Learn more about
  /// [managing orders and fulfillment](https://shopify.dev/docs/apps/build/orders-fulfillment).
  static let LineItem = ApolloAPI.Object(
    typename: "LineItem",
    implementedInterfaces: [Interfaces.Node.self],
    keyFields: nil
  )
}
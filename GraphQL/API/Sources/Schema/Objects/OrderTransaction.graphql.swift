// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// The `OrderTransaction` object represents a payment transaction that's associated with an order. An order
  /// transaction is a specific action or event that happens within the context of an order, such as a customer paying
  /// for a purchase or receiving a refund, or other payment-related activity.
  ///
  /// Use the `OrderTransaction` object to capture the complete lifecycle of a payment, from initial
  /// authorization to final settlement, including refunds and currency exchanges. Common use cases for using the
  /// `OrderTransaction` object include:
  ///
  /// - Processing new payments for orders
  /// - Managing payment authorizations and captures
  /// - Processing refunds for returned items
  /// - Tracking payment status and errors
  /// - Managing multi-currency transactions
  /// - Handling payment gateway integrations
  ///
  /// Each `OrderTransaction` object has a [`kind`](https://shopify.dev/docs/api/admin-graphql/latest/enums/OrderTransactionKind)
  /// that defines the type of transaction and a [`status`](https://shopify.dev/docs/api/admin-graphql/latest/enums/OrderTransactionStatus)
  /// that indicates the current state of the transaction. The object stores detailed information about payment
  /// methods, gateway processing, and settlement details.
  ///
  /// Learn more about [payment processing](https://help.shopify.com/manual/payments)
  /// and [payment gateway integrations](https://www.shopify.com/ca/payment-gateways).
  static let OrderTransaction = ApolloAPI.Object(
    typename: "OrderTransaction",
    implementedInterfaces: [Interfaces.Node.self],
    keyFields: nil
  )
}
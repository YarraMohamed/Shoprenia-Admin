// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// A debit revert transaction which increases the store credit account balance.
  /// Debit revert transactions are created automatically when a [store credit account debit transaction](https://shopify.dev/api/admin-graphql/latest/objects/StoreCreditAccountDebitTransaction) is reverted.
  ///
  /// Store credit account debit transactions are reverted when an order is cancelled, refunded or in the event of a payment failure at checkout.
  /// The amount added to the balance is equal to the amount reverted on the original credit.
  static let StoreCreditAccountDebitRevertTransaction = ApolloAPI.Object(
    typename: "StoreCreditAccountDebitRevertTransaction",
    implementedInterfaces: [
      Interfaces.Node.self,
      Interfaces.StoreCreditAccountTransaction.self
    ],
    keyFields: nil
  )
}
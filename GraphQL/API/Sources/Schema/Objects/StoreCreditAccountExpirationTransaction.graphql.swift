// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// An expiration transaction which decreases the store credit account balance.
  /// Expiration transactions are created automatically when a [store credit account credit transaction](https://shopify.dev/api/admin-graphql/latest/objects/StoreCreditAccountCreditTransaction) expires.
  ///
  /// The amount subtracted from the balance is equal to the remaining amount of the credit transaction.
  static let StoreCreditAccountExpirationTransaction = ApolloAPI.Object(
    typename: "StoreCreditAccountExpirationTransaction",
    implementedInterfaces: [Interfaces.StoreCreditAccountTransaction.self],
    keyFields: nil
  )
}
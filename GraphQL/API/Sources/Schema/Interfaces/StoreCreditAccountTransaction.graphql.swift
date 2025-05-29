// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Interfaces {
  /// Interface for a store credit account transaction.
  static let StoreCreditAccountTransaction = ApolloAPI.Interface(
    name: "StoreCreditAccountTransaction",
    keyFields: nil,
    implementingObjects: [
      "StoreCreditAccountCreditTransaction",
      "StoreCreditAccountDebitRevertTransaction",
      "StoreCreditAccountDebitTransaction",
      "StoreCreditAccountExpirationTransaction"
    ]
  )
}
// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// A TenderTransaction represents a transaction with financial impact on a shop's balance sheet. A tender transaction always
  /// represents actual money movement between a buyer and a shop. TenderTransactions can be used instead of OrderTransactions
  /// for reconciling a shop's cash flow. A TenderTransaction is immutable once created.
  static let TenderTransaction = ApolloAPI.Object(
    typename: "TenderTransaction",
    implementedInterfaces: [Interfaces.Node.self],
    keyFields: nil
  )
}
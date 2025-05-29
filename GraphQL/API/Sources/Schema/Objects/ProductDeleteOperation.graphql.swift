// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// An entity that represents details of an asynchronous
  /// [ProductDelete](https://shopify.dev/api/admin-graphql/current/mutations/productDelete) mutation.
  ///
  /// By querying this entity with the
  /// [productOperation](https://shopify.dev/api/admin-graphql/current/queries/productOperation) query
  /// using the ID that was returned when the product was deleted, this can be used to check the status of an operation.
  ///
  /// The `status` field indicates whether the operation is `CREATED`, `ACTIVE`, or `COMPLETE`.
  ///
  /// The `deletedProductId` field provides the ID of the deleted product.
  ///
  /// The `userErrors` field provides mutation errors that occurred during the operation.
  static let ProductDeleteOperation = ApolloAPI.Object(
    typename: "ProductDeleteOperation",
    implementedInterfaces: [
      Interfaces.Node.self,
      Interfaces.ProductOperation.self
    ],
    keyFields: nil
  )
}
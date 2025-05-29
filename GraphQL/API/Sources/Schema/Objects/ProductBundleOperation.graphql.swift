// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// An entity that represents details of an asynchronous
  /// [ProductBundleCreate](https://shopify.dev/api/admin-graphql/current/mutations/productBundleCreate) or
  /// [ProductBundleUpdate](https://shopify.dev/api/admin-graphql/current/mutations/productBundleUpdate) mutation.
  ///
  /// By querying this entity with the
  /// [productOperation](https://shopify.dev/api/admin-graphql/current/queries/productOperation) query
  /// using the ID that was returned when the bundle was created or updated, this can be used to check the status of an operation.
  ///
  /// The `status` field indicates whether the operation is `CREATED`, `ACTIVE`, or `COMPLETE`.
  ///
  /// The `product` field provides the details of the created or updated product.
  ///
  /// The `userErrors` field provides mutation errors that occurred during the operation.
  static let ProductBundleOperation = ApolloAPI.Object(
    typename: "ProductBundleOperation",
    implementedInterfaces: [
      Interfaces.Node.self,
      Interfaces.ProductOperation.self
    ],
    keyFields: nil
  )
}
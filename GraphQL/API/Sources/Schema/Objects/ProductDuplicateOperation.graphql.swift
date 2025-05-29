// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// An entity that represents details of an asynchronous
  /// [ProductDuplicate](https://shopify.dev/api/admin-graphql/current/mutations/productDuplicate) mutation.
  ///
  /// By querying this entity with the
  /// [productOperation](https://shopify.dev/api/admin-graphql/current/queries/productOperation) query
  /// using the ID that was returned
  /// [when the product was duplicated](https://shopify.dev/api/admin/migrate/new-product-model/sync-data#create-a-product-with-variants-and-options-asynchronously),
  /// this can be used to check the status of an operation.
  ///
  /// The `status` field indicates whether the operation is `CREATED`, `ACTIVE`, or `COMPLETE`.
  ///
  /// The `product` field provides the details of the original product.
  ///
  /// The `newProduct` field provides the details of the new duplicate of the product.
  ///
  /// The `userErrors` field provides mutation errors that occurred during the operation.
  static let ProductDuplicateOperation = ApolloAPI.Object(
    typename: "ProductDuplicateOperation",
    implementedInterfaces: [
      Interfaces.Node.self,
      Interfaces.ProductOperation.self
    ],
    keyFields: nil
  )
}
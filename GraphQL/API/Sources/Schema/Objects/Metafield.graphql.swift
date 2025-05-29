// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// Metafields enable you to attach additional information to a Shopify resource, such as a [Product](https://shopify.dev/api/admin-graphql/latest/objects/product) or a [Collection](https://shopify.dev/api/admin-graphql/latest/objects/collection).
  /// For more information about where you can attach metafields refer to [HasMetafields](https://shopify.dev/api/admin/graphql/reference/common-objects/HasMetafields).
  /// Some examples of the data that metafields enable you to store are specifications, size charts, downloadable documents, release dates, images, or part numbers.
  /// Metafields are identified by an owner resource, namespace, and key. and store a value along with type information for that value.
  static let Metafield = ApolloAPI.Object(
    typename: "Metafield",
    implementedInterfaces: [
      Interfaces.HasCompareDigest.self,
      Interfaces.LegacyInteroperability.self,
      Interfaces.Node.self
    ],
    keyFields: nil
  )
}
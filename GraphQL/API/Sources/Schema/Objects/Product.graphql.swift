// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// The `Product` object lets you manage products in a merchant’s store.
  ///
  /// Products are the goods and services that merchants offer to customers. They can include various details such as title, description, price, images, and options such as size or color.
  /// You can use [product variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/productvariant) to create or update different versions of the same product.
  /// You can also add or update product [media](https://shopify.dev/docs/api/admin-graphql/latest/interfaces/media).
  /// Products can be organized by grouping them into a [collection](https://shopify.dev/docs/api/admin-graphql/latest/objects/collection).
  ///
  /// Learn more about working with [Shopify's product model](https://shopify.dev/docs/apps/build/graphql/migrate/new-product-model/product-model-components),
  /// including limitations and considerations.
  static let Product = ApolloAPI.Object(
    typename: "Product",
    implementedInterfaces: [
      Interfaces.HasEvents.self,
      Interfaces.HasMetafieldDefinitions.self,
      Interfaces.HasMetafields.self,
      Interfaces.HasPublishedTranslations.self,
      Interfaces.LegacyInteroperability.self,
      Interfaces.Navigable.self,
      Interfaces.Node.self,
      Interfaces.OnlineStorePreviewable.self,
      Interfaces.Publishable.self
    ],
    keyFields: nil
  )
}
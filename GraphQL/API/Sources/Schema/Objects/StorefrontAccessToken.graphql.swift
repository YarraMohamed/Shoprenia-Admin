// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// A token that's used to delegate unauthenticated access scopes to clients that need to access
  /// the unauthenticated [Storefront API](https://shopify.dev/docs/api/storefront).
  ///
  /// An app can have a maximum of 100 active storefront access
  /// tokens for each shop.
  ///
  /// [Get started with the Storefront API](https://shopify.dev/docs/storefronts/headless/building-with-the-storefront-api/getting-started).
  static let StorefrontAccessToken = ApolloAPI.Object(
    typename: "StorefrontAccessToken",
    implementedInterfaces: [Interfaces.Node.self],
    keyFields: nil
  )
}
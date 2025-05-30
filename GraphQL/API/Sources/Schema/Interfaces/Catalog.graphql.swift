// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Interfaces {
  /// A list of products with publishing and pricing information.
  /// A catalog can be associated with a specific context, such as a [`Market`](https://shopify.dev/api/admin-graphql/current/objects/market), [`CompanyLocation`](https://shopify.dev/api/admin-graphql/current/objects/companylocation), or [`App`](https://shopify.dev/api/admin-graphql/current/objects/app).
  static let Catalog = ApolloAPI.Interface(
    name: "Catalog",
    keyFields: nil,
    implementingObjects: [
      "AppCatalog",
      "CompanyLocationCatalog",
      "MarketCatalog"
    ]
  )
}
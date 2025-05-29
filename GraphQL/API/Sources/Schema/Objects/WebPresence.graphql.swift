// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// This can be a domain (e.g. `example.ca`), subdomain (e.g. `ca.example.com`), or subfolders of the primary
  /// domain (e.g. `example.com/en-ca`). Each web presence comprises one or more language
  /// variants.
  ///
  /// Note: while the domain/subfolders defined by a web presence are not applicable to
  /// custom storefronts, which must manage their own domains and routing, the languages chosen
  /// here do govern [the languages available on the Storefront
  /// API](https://shopify.dev/custom-storefronts/internationalization/multiple-languages) for the countries
  /// using this web presence.
  static let WebPresence = ApolloAPI.Object(
    typename: "WebPresence",
    implementedInterfaces: [Interfaces.Node.self],
    keyFields: nil
  )
}
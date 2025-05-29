// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// A location or branch of a [company that's a customer](https://shopify.dev/api/admin-graphql/latest/objects/company) of the shop. Configuration of B2B relationship, for example prices lists and checkout settings, may be done for a location.
  static let CompanyLocation = ApolloAPI.Object(
    typename: "CompanyLocation",
    implementedInterfaces: [
      Interfaces.CommentEventSubject.self,
      Interfaces.HasEvents.self,
      Interfaces.HasMetafieldDefinitions.self,
      Interfaces.HasMetafields.self,
      Interfaces.Navigable.self,
      Interfaces.Node.self
    ],
    keyFields: nil
  )
}
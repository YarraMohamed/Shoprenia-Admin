// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Interfaces {
  /// Represents a resource that can be published to a channel.
  /// A publishable resource can be either a Product or Collection.
  static let Publishable = ApolloAPI.Interface(
    name: "Publishable",
    keyFields: nil,
    implementingObjects: [
      "Collection",
      "Product"
    ]
  )
}
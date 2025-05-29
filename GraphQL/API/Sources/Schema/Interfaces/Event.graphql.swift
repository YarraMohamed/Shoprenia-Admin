// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Interfaces {
  /// Events chronicle resource activities such as the creation of an article, the fulfillment of an order, or the
  /// addition of a product.
  static let Event = ApolloAPI.Interface(
    name: "Event",
    keyFields: nil,
    implementingObjects: [
      "BasicEvent",
      "CommentEvent"
    ]
  )
}
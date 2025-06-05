// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields required to create a product option value.
public struct OptionValueCreateInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    name: GraphQLNullable<String> = nil,
    linkedMetafieldValue: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "name": name,
      "linkedMetafieldValue": linkedMetafieldValue
    ])
  }

  /// Value associated with an option.
  public var name: GraphQLNullable<String> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  /// Metafield value associated with an option.
  public var linkedMetafieldValue: GraphQLNullable<String> {
    get { __data["linkedMetafieldValue"] }
    set { __data["linkedMetafieldValue"] = newValue }
  }
}

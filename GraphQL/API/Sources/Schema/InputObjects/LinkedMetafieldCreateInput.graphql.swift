// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields required to link a product option to a metafield.
public struct LinkedMetafieldCreateInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    namespace: String,
    key: String,
    values: GraphQLNullable<[String]> = nil
  ) {
    __data = InputDict([
      "namespace": namespace,
      "key": key,
      "values": values
    ])
  }

  /// The namespace of the metafield this option is linked to.
  public var namespace: String {
    get { __data["namespace"] }
    set { __data["namespace"] = newValue }
  }

  /// The key of the metafield this option is linked to.
  public var key: String {
    get { __data["key"] }
    set { __data["key"] = newValue }
  }

  /// Values associated with the option.
  public var values: GraphQLNullable<[String]> {
    get { __data["values"] }
    set { __data["values"] = newValue }
  }
}

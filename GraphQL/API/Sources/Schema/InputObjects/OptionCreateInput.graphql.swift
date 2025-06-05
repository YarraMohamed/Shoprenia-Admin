// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for creating a product option.
public struct OptionCreateInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    name: GraphQLNullable<String> = nil,
    position: GraphQLNullable<Int> = nil,
    values: GraphQLNullable<[OptionValueCreateInput]> = nil,
    linkedMetafield: GraphQLNullable<LinkedMetafieldCreateInput> = nil
  ) {
    __data = InputDict([
      "name": name,
      "position": position,
      "values": values,
      "linkedMetafield": linkedMetafield
    ])
  }

  /// Name of the option.
  public var name: GraphQLNullable<String> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  /// Position of the option.
  public var position: GraphQLNullable<Int> {
    get { __data["position"] }
    set { __data["position"] = newValue }
  }

  /// Values associated with the option.
  public var values: GraphQLNullable<[OptionValueCreateInput]> {
    get { __data["values"] }
    set { __data["values"] = newValue }
  }

  /// Specifies the metafield the option is linked to.
  public var linkedMetafield: GraphQLNullable<LinkedMetafieldCreateInput> {
    get { __data["linkedMetafield"] }
    set { __data["linkedMetafield"] = newValue }
  }
}

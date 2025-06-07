// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields required to create or modify a product variant's option value.
public struct VariantOptionValueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    id: GraphQLNullable<ID> = nil,
    name: GraphQLNullable<String> = nil,
    linkedMetafieldValue: GraphQLNullable<String> = nil,
    optionId: GraphQLNullable<ID> = nil,
    optionName: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "id": id,
      "name": name,
      "linkedMetafieldValue": linkedMetafieldValue,
      "optionId": optionId,
      "optionName": optionName
    ])
  }

  /// Specifies the product option value by ID.
  public var id: GraphQLNullable<ID> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  /// Specifies the product option value by name.
  public var name: GraphQLNullable<String> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  /// Metafield value associated with an option.
  public var linkedMetafieldValue: GraphQLNullable<String> {
    get { __data["linkedMetafieldValue"] }
    set { __data["linkedMetafieldValue"] = newValue }
  }

  /// Specifies the product option by ID.
  public var optionId: GraphQLNullable<ID> {
    get { __data["optionId"] }
    set { __data["optionId"] = newValue }
  }

  /// Specifies the product option by name.
  public var optionName: GraphQLNullable<String> {
    get { __data["optionName"] }
    set { __data["optionName"] = newValue }
  }
}

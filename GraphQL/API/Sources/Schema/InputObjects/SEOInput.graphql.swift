// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for SEO information.
public struct SEOInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    title: GraphQLNullable<String> = nil,
    description: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "title": title,
      "description": description
    ])
  }

  /// SEO title of the product.
  public var title: GraphQLNullable<String> {
    get { __data["title"] }
    set { __data["title"] = newValue }
  }

  /// SEO description of the product.
  public var description: GraphQLNullable<String> {
    get { __data["description"] }
    set { __data["description"] = newValue }
  }
}

// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetVendorsQuery: GraphQLQuery {
  public static let operationName: String = "GetVendors"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetVendors { productVendors(first: 100) { __typename nodes } }"#
    ))

  public init() {}

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("productVendors", ProductVendors?.self, arguments: ["first": 100]),
    ] }

    /// The list of vendors added to products.
    /// The maximum page size is 1000.
    public var productVendors: ProductVendors? { __data["productVendors"] }

    /// ProductVendors
    ///
    /// Parent Type: `StringConnection`
    public struct ProductVendors: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.StringConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [String].self),
      ] }

      /// A list of nodes that are contained in StringEdge. You can fetch data about an individual node, or you can follow the edges to fetch data about a collection of related nodes. At each node, you specify the fields that you want to retrieve.
      public var nodes: [String] { __data["nodes"] }
    }
  }
}

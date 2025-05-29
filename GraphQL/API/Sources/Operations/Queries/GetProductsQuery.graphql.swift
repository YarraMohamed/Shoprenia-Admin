// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetProductsQuery: GraphQLQuery {
  public static let operationName: String = "GetProducts"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetProducts { products(first: 10) { __typename edges { __typename node { __typename id title } } } }"#
    ))

  public init() {}

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("products", Products.self, arguments: ["first": 10]),
    ] }

    /// Returns a list of products.
    public var products: Products { __data["products"] }

    /// Products
    ///
    /// Parent Type: `ProductConnection`
    public struct Products: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("edges", [Edge].self),
      ] }

      /// The connection between the node and its parent. Each edge contains a minimum of the edge's cursor and the node.
      public var edges: [Edge] { __data["edges"] }

      /// Products.Edge
      ///
      /// Parent Type: `ProductEdge`
      public struct Edge: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductEdge }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("node", Node.self),
        ] }

        /// The item at the end of ProductEdge.
        public var node: Node { __data["node"] }

        /// Products.Edge.Node
        ///
        /// Parent Type: `Product`
        public struct Node: Shopify.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Product }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Shopify.ID.self),
            .field("title", String.self),
          ] }

          /// A globally-unique ID.
          public var id: Shopify.ID { __data["id"] }
          /// The name for the product that displays to customers. The title is used to construct the product's handle.
          /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
          public var title: String { __data["title"] }
        }
      }
    }
  }
}

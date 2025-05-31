// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllVendorsQuery: GraphQLQuery {
  public static let operationName: String = "GetAllVendors"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetAllVendors { collections(first: 20) { __typename nodes { __typename handle title image { __typename url } id } } }"#
    ))

  public init() {}

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("collections", Collections.self, arguments: ["first": 20]),
    ] }

    /// Returns a list of collections.
    public var collections: Collections { __data["collections"] }

    /// Collections
    ///
    /// Parent Type: `CollectionConnection`
    public struct Collections: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.CollectionConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node].self),
      ] }

      /// A list of nodes that are contained in CollectionEdge. You can fetch data about an individual node, or you can follow the edges to fetch data about a collection of related nodes. At each node, you specify the fields that you want to retrieve.
      public var nodes: [Node] { __data["nodes"] }

      /// Collections.Node
      ///
      /// Parent Type: `Collection`
      public struct Node: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Collection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("handle", String.self),
          .field("title", String.self),
          .field("image", Image?.self),
          .field("id", Shopify.ID.self),
        ] }

        /// A unique string that identifies the collection. If a handle isn't specified when a collection is created, it's automatically generated from the collection's original title, and typically includes words from the title separated by hyphens. For example, a collection that was created with the title `Summer Catalog 2022` might have the handle `summer-catalog-2022`.
        ///
        /// If the title is changed, the handle doesn't automatically change.
        ///
        /// The handle can be used in themes by the Liquid templating language to refer to the collection, but using the ID is preferred because it never changes.
        public var handle: String { __data["handle"] }
        /// The name of the collection. It's displayed in the Shopify admin and is typically displayed in sales channels, such as an online store.
        public var title: String { __data["title"] }
        /// The image associated with the collection.
        public var image: Image? { __data["image"] }
        /// A globally-unique ID.
        public var id: Shopify.ID { __data["id"] }

        /// Collections.Node.Image
        ///
        /// Parent Type: `Image`
        public struct Image: Shopify.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Image }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("url", Shopify.URL.self),
          ] }

          /// The location of the image as a URL.
          ///
          /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
          ///
          /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
          ///
          /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
          public var url: Shopify.URL { __data["url"] }
        }
      }
    }
  }
}

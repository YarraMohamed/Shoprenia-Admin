// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetVendorProductsQuery: GraphQLQuery {
  public static let operationName: String = "GetVendorProducts"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetVendorProducts($vendor: String!) { products(query: $vendor, first: 20) { __typename nodes { __typename id title totalInventory variants(first: 100) { __typename nodes { __typename availableForSale price } } media(first: 1) { __typename nodes { __typename ... on MediaImage { image { __typename url } } } } } } }"#
    ))

  public var vendor: String

  public init(vendor: String) {
    self.vendor = vendor
  }

  public var __variables: Variables? { ["vendor": vendor] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("products", Products.self, arguments: [
        "query": .variable("vendor"),
        "first": 20
      ]),
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
        .field("nodes", [Node].self),
      ] }

      /// A list of nodes that are contained in ProductEdge. You can fetch data about an individual node, or you can follow the edges to fetch data about a collection of related nodes. At each node, you specify the fields that you want to retrieve.
      public var nodes: [Node] { __data["nodes"] }

      /// Products.Node
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
          .field("totalInventory", Int.self),
          .field("variants", Variants.self, arguments: ["first": 100]),
          .field("media", Media.self, arguments: ["first": 1]),
        ] }

        /// A globally-unique ID.
        public var id: Shopify.ID { __data["id"] }
        /// The name for the product that displays to customers. The title is used to construct the product's handle.
        /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
        public var title: String { __data["title"] }
        /// The quantity of inventory that's in stock.
        public var totalInventory: Int { __data["totalInventory"] }
        /// A list of [variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/ProductVariant) associated with the product.
        /// If querying a single product at the root, you can fetch up to 2000 variants.
        public var variants: Variants { __data["variants"] }
        /// The [media](https://shopify.dev/docs/apps/build/online-store/product-media) associated with the product. Valid media are images, 3D models, videos.
        public var media: Media { __data["media"] }

        /// Products.Node.Variants
        ///
        /// Parent Type: `ProductVariantConnection`
        public struct Variants: Shopify.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductVariantConnection }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("nodes", [Node].self),
          ] }

          /// A list of nodes that are contained in ProductVariantEdge. You can fetch data about an individual node, or you can follow the edges to fetch data about a collection of related nodes. At each node, you specify the fields that you want to retrieve.
          public var nodes: [Node] { __data["nodes"] }

          /// Products.Node.Variants.Node
          ///
          /// Parent Type: `ProductVariant`
          public struct Node: Shopify.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductVariant }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("availableForSale", Bool.self),
              .field("price", Shopify.Money.self),
            ] }

            /// Whether the product variant is available for sale.
            public var availableForSale: Bool { __data["availableForSale"] }
            /// The price of the product variant in the default shop currency.
            public var price: Shopify.Money { __data["price"] }
          }
        }

        /// Products.Node.Media
        ///
        /// Parent Type: `MediaConnection`
        public struct Media: Shopify.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.MediaConnection }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("nodes", [Node].self),
          ] }

          /// A list of nodes that are contained in MediaEdge. You can fetch data about an individual node, or you can follow the edges to fetch data about a collection of related nodes. At each node, you specify the fields that you want to retrieve.
          public var nodes: [Node] { __data["nodes"] }

          /// Products.Node.Media.Node
          ///
          /// Parent Type: `Media`
          public struct Node: Shopify.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { Shopify.Interfaces.Media }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .inlineFragment(AsMediaImage.self),
            ] }

            public var asMediaImage: AsMediaImage? { _asInlineFragment() }

            /// Products.Node.Media.Node.AsMediaImage
            ///
            /// Parent Type: `MediaImage`
            public struct AsMediaImage: Shopify.InlineFragment {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public typealias RootEntityType = GetVendorProductsQuery.Data.Products.Node.Media.Node
              public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.MediaImage }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("image", Image?.self),
              ] }

              /// The image for the media. Returns `null` until `status` is `READY`.
              public var image: Image? { __data["image"] }

              /// Products.Node.Media.Node.AsMediaImage.Image
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
    }
  }
}

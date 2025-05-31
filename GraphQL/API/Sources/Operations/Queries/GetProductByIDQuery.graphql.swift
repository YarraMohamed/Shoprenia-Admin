// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetProductByIDQuery: GraphQLQuery {
  public static let operationName: String = "GetProductByID"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetProductByID($id: ID!) { product(id: $id) { __typename description id media(first: 5) { __typename nodes { __typename ... on MediaImage { image { __typename url } } } } title totalInventory totalVariants variants(first: 20) { __typename nodes { __typename availableForSale displayName price } } } }"#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("product", Product?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Returns a Product resource by ID.
    public var product: Product? { __data["product"] }

    /// Product
    ///
    /// Parent Type: `Product`
    public struct Product: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Product }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("description", String.self),
        .field("id", Shopify.ID.self),
        .field("media", Media.self, arguments: ["first": 5]),
        .field("title", String.self),
        .field("totalInventory", Int.self),
        .field("totalVariants", Int.self),
        .field("variants", Variants.self, arguments: ["first": 20]),
      ] }

      /// A single-line description of the product,
      /// with [HTML tags](https://developer.mozilla.org/en-US/docs/Web/HTML) removed.
      public var description: String { __data["description"] }
      /// A globally-unique ID.
      public var id: Shopify.ID { __data["id"] }
      /// The [media](https://shopify.dev/docs/apps/build/online-store/product-media) associated with the product. Valid media are images, 3D models, videos.
      public var media: Media { __data["media"] }
      /// The name for the product that displays to customers. The title is used to construct the product's handle.
      /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
      public var title: String { __data["title"] }
      /// The quantity of inventory that's in stock.
      public var totalInventory: Int { __data["totalInventory"] }
      /// The number of [variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/ProductVariant)
      /// that are associated with the product.
      @available(*, deprecated, message: "Use `variantsCount` instead.")
      public var totalVariants: Int { __data["totalVariants"] }
      /// A list of [variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/ProductVariant) associated with the product.
      /// If querying a single product at the root, you can fetch up to 2000 variants.
      public var variants: Variants { __data["variants"] }

      /// Product.Media
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

        /// Product.Media.Node
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

          /// Product.Media.Node.AsMediaImage
          ///
          /// Parent Type: `MediaImage`
          public struct AsMediaImage: Shopify.InlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = GetProductByIDQuery.Data.Product.Media.Node
            public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.MediaImage }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("image", Image?.self),
            ] }

            /// The image for the media. Returns `null` until `status` is `READY`.
            public var image: Image? { __data["image"] }

            /// Product.Media.Node.AsMediaImage.Image
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

      /// Product.Variants
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

        /// Product.Variants.Node
        ///
        /// Parent Type: `ProductVariant`
        public struct Node: Shopify.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductVariant }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("availableForSale", Bool.self),
            .field("displayName", String.self),
            .field("price", Shopify.Money.self),
          ] }

          /// Whether the product variant is available for sale.
          public var availableForSale: Bool { __data["availableForSale"] }
          /// Display name of the variant, based on product's title + variant's title.
          public var displayName: String { __data["displayName"] }
          /// The price of the product variant in the default shop currency.
          public var price: Shopify.Money { __data["price"] }
        }
      }
    }
  }
}

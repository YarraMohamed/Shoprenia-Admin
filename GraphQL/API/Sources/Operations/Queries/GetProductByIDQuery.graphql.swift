// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetProductByIDQuery: GraphQLQuery {
  public static let operationName: String = "GetProductByID"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetProductByID($id: ID!) { product(id: $id) { __typename id title descriptionHtml isGiftCard totalInventory vendor productType tags variants(first: 100) { __typename nodes { __typename availableForSale id price title inventoryQuantity } } options(first: 50) { __typename id name optionValues { __typename hasVariants id name } } media(first: 50) { __typename nodes { __typename ... on MediaImage { image { __typename url } } } } } }"#
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
        .field("id", Shopify.ID.self),
        .field("title", String.self),
        .field("descriptionHtml", Shopify.HTML.self),
        .field("isGiftCard", Bool.self),
        .field("totalInventory", Int.self),
        .field("vendor", String.self),
        .field("productType", String.self),
        .field("tags", [String].self),
        .field("variants", Variants.self, arguments: ["first": 100]),
        .field("options", [Option].self, arguments: ["first": 50]),
        .field("media", Media.self, arguments: ["first": 50]),
      ] }

      /// A globally-unique ID.
      public var id: Shopify.ID { __data["id"] }
      /// The name for the product that displays to customers. The title is used to construct the product's handle.
      /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
      public var title: String { __data["title"] }
      /// The description of the product, with
      /// HTML tags. For example, the description might include
      /// bold `<strong></strong>` and italic `<i></i>` text.
      public var descriptionHtml: Shopify.HTML { __data["descriptionHtml"] }
      /// Whether the product is a gift card.
      public var isGiftCard: Bool { __data["isGiftCard"] }
      /// The quantity of inventory that's in stock.
      public var totalInventory: Int { __data["totalInventory"] }
      /// The name of the product's vendor.
      public var vendor: String { __data["vendor"] }
      /// The [product type](https://help.shopify.com/manual/products/details/product-type)
      /// that merchants define.
      public var productType: String { __data["productType"] }
      /// A comma-separated list of searchable keywords that are
      /// associated with the product. For example, a merchant might apply the `sports`
      /// and `summer` tags to products that are associated with sportwear for summer.
      ///
      /// Updating `tags` overwrites
      /// any existing tags that were previously added to the product. To add new tags without overwriting
      /// existing tags, use the [`tagsAdd`](https://shopify.dev/api/admin-graphql/latest/mutations/tagsadd)
      /// mutation.
      public var tags: [String] { __data["tags"] }
      /// A list of [variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/ProductVariant) associated with the product.
      /// If querying a single product at the root, you can fetch up to 2000 variants.
      public var variants: Variants { __data["variants"] }
      /// A list of product options. The limit is defined by the
      /// [shop's resource limits for product options](https://shopify.dev/docs/api/admin-graphql/latest/objects/Shop#field-resourcelimits) (`Shop.resourceLimits.maxProductOptions`).
      public var options: [Option] { __data["options"] }
      /// The [media](https://shopify.dev/docs/apps/build/online-store/product-media) associated with the product. Valid media are images, 3D models, videos.
      public var media: Media { __data["media"] }

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
            .field("id", Shopify.ID.self),
            .field("price", Shopify.Money.self),
            .field("title", String.self),
            .field("inventoryQuantity", Int?.self),
          ] }

          /// Whether the product variant is available for sale.
          public var availableForSale: Bool { __data["availableForSale"] }
          /// A globally-unique ID.
          public var id: Shopify.ID { __data["id"] }
          /// The price of the product variant in the default shop currency.
          public var price: Shopify.Money { __data["price"] }
          /// The title of the product variant.
          public var title: String { __data["title"] }
          /// The total sellable quantity of the variant.
          public var inventoryQuantity: Int? { __data["inventoryQuantity"] }
        }
      }

      /// Product.Option
      ///
      /// Parent Type: `ProductOption`
      public struct Option: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductOption }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Shopify.ID.self),
          .field("name", String.self),
          .field("optionValues", [OptionValue].self),
        ] }

        /// A globally-unique ID.
        public var id: Shopify.ID { __data["id"] }
        /// The product option’s name.
        public var name: String { __data["name"] }
        /// Similar to values, option_values returns all the corresponding option value objects to the product option, including values not assigned to any variants.
        public var optionValues: [OptionValue] { __data["optionValues"] }

        /// Product.Option.OptionValue
        ///
        /// Parent Type: `ProductOptionValue`
        public struct OptionValue: Shopify.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductOptionValue }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("hasVariants", Bool.self),
            .field("id", Shopify.ID.self),
            .field("name", String.self),
          ] }

          /// Whether the product option value has any linked variants.
          public var hasVariants: Bool { __data["hasVariants"] }
          /// A globally-unique ID.
          public var id: Shopify.ID { __data["id"] }
          /// The name of the product option value.
          public var name: String { __data["name"] }
        }
      }

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
    }
  }
}

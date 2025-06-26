// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateProductMutation: GraphQLMutation {
  public static let operationName: String = "CreateProduct"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateProduct($title: String!, $descriptionHtml: String!, $productType: String!, $vendor: String!, $media: [CreateMediaInput!]!) { productCreate( product: { title: $title descriptionHtml: $descriptionHtml productType: $productType vendor: $vendor } media: $media ) { __typename product { __typename id title descriptionHtml vendor productType tags variants(first: 10) { __typename nodes { __typename inventoryItem { __typename id } } } images(first: 10) { __typename nodes { __typename id originalSrc } } } userErrors { __typename field message } } }"#
    ))

  public var title: String
  public var descriptionHtml: String
  public var productType: String
  public var vendor: String
  public var media: [CreateMediaInput]

  public init(
    title: String,
    descriptionHtml: String,
    productType: String,
    vendor: String,
    media: [CreateMediaInput]
  ) {
    self.title = title
    self.descriptionHtml = descriptionHtml
    self.productType = productType
    self.vendor = vendor
    self.media = media
  }

  public var __variables: Variables? { [
    "title": title,
    "descriptionHtml": descriptionHtml,
    "productType": productType,
    "vendor": vendor,
    "media": media
  ] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("productCreate", ProductCreate?.self, arguments: [
        "product": [
          "title": .variable("title"),
          "descriptionHtml": .variable("descriptionHtml"),
          "productType": .variable("productType"),
          "vendor": .variable("vendor")
        ],
        "media": .variable("media")
      ]),
    ] }

    /// Creates a [product](https://shopify.dev/docs/api/admin-graphql/latest/objects/Product)
    /// with attributes such as title, description, and vendor.
    /// You can use the `productCreate` mutation to define
    /// [options](https://shopify.dev/docs/api/admin-graphql/latest/objects/ProductOption) and
    /// [values](https://shopify.dev/docs/api/admin-graphql/latest/objects/ProductOptionValue)
    /// for products with
    /// [product variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/ProductVariant),
    /// such as different sizes or colors.
    ///
    /// To create multiple product variants for a single product and manage prices, use the
    /// [`productVariantsBulkCreate`](https://shopify.dev/docs/api/admin-graphql/latest/mutations/productVariantsBulkCreate)
    /// mutation.
    ///
    /// To create or update a product in a single request, use the
    /// [`productSet`](https://shopify.dev/docs/api/admin-graphql/latest/mutations/productSet) mutation.
    ///
    /// Learn more about the [product model](https://shopify.dev/docs/apps/build/graphql/migrate/new-product-model)
    /// and [adding product data](https://shopify.dev/docs/apps/build/graphql/migrate/new-product-model/add-data).
    public var productCreate: ProductCreate? { __data["productCreate"] }

    /// ProductCreate
    ///
    /// Parent Type: `ProductCreatePayload`
    public struct ProductCreate: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("product", Product?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The product object.
      public var product: Product? { __data["product"] }
      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

      /// ProductCreate.Product
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
          .field("vendor", String.self),
          .field("productType", String.self),
          .field("tags", [String].self),
          .field("variants", Variants.self, arguments: ["first": 10]),
          .field("images", Images.self, arguments: ["first": 10]),
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
        /// The images associated with the product.
        @available(*, deprecated, message: "Use `media` instead.")
        public var images: Images { __data["images"] }

        /// ProductCreate.Product.Variants
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

          /// ProductCreate.Product.Variants.Node
          ///
          /// Parent Type: `ProductVariant`
          public struct Node: Shopify.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductVariant }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("inventoryItem", InventoryItem.self),
            ] }

            /// The inventory item, which is used to query for inventory information.
            public var inventoryItem: InventoryItem { __data["inventoryItem"] }

            /// ProductCreate.Product.Variants.Node.InventoryItem
            ///
            /// Parent Type: `InventoryItem`
            public struct InventoryItem: Shopify.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.InventoryItem }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("id", Shopify.ID.self),
              ] }

              /// A globally-unique ID.
              public var id: Shopify.ID { __data["id"] }
            }
          }
        }

        /// ProductCreate.Product.Images
        ///
        /// Parent Type: `ImageConnection`
        public struct Images: Shopify.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ImageConnection }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("nodes", [Node].self),
          ] }

          /// A list of nodes that are contained in ImageEdge. You can fetch data about an individual node, or you can follow the edges to fetch data about a collection of related nodes. At each node, you specify the fields that you want to retrieve.
          public var nodes: [Node] { __data["nodes"] }

          /// ProductCreate.Product.Images.Node
          ///
          /// Parent Type: `Image`
          public struct Node: Shopify.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Image }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Shopify.ID?.self),
              .field("originalSrc", Shopify.URL.self),
            ] }

            /// A unique ID for the image.
            public var id: Shopify.ID? { __data["id"] }
            /// The location of the original image as a URL.
            ///
            /// If there are any existing transformations in the original source URL, they will remain and not be stripped.
            @available(*, deprecated, message: "Use `url` instead.")
            public var originalSrc: Shopify.URL { __data["originalSrc"] }
          }
        }
      }

      /// ProductCreate.UserError
      ///
      /// Parent Type: `UserError`
      public struct UserError: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.UserError }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("field", [String]?.self),
          .field("message", String.self),
        ] }

        /// The path to the input field that caused the error.
        public var field: [String]? { __data["field"] }
        /// The error message.
        public var message: String { __data["message"] }
      }
    }
  }
}

// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateProductVariantsMutation: GraphQLMutation {
  public static let operationName: String = "CreateProductVariants"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateProductVariants($id: ID!, $variants: [ProductVariantsBulkInput!]!) { productVariantsBulkCreate(productId: $id, variants: $variants) { __typename product { __typename descriptionHtml id title options(first: 10) { __typename name values } productType variants(first: 10) { __typename nodes { __typename id inventoryQuantity price title } } vendor } userErrors { __typename message field } } }"#
    ))

  public var id: ID
  public var variants: [ProductVariantsBulkInput]

  public init(
    id: ID,
    variants: [ProductVariantsBulkInput]
  ) {
    self.id = id
    self.variants = variants
  }

  public var __variables: Variables? { [
    "id": id,
    "variants": variants
  ] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("productVariantsBulkCreate", ProductVariantsBulkCreate?.self, arguments: [
        "productId": .variable("id"),
        "variants": .variable("variants")
      ]),
    ] }

    /// Creates multiple variants in a single product. This mutation can be called directly or via the bulkOperation.
    public var productVariantsBulkCreate: ProductVariantsBulkCreate? { __data["productVariantsBulkCreate"] }

    /// ProductVariantsBulkCreate
    ///
    /// Parent Type: `ProductVariantsBulkCreatePayload`
    public struct ProductVariantsBulkCreate: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductVariantsBulkCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("product", Product?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The updated product object.
      public var product: Product? { __data["product"] }
      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

      /// ProductVariantsBulkCreate.Product
      ///
      /// Parent Type: `Product`
      public struct Product: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Product }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("descriptionHtml", Shopify.HTML.self),
          .field("id", Shopify.ID.self),
          .field("title", String.self),
          .field("options", [Option].self, arguments: ["first": 10]),
          .field("productType", String.self),
          .field("variants", Variants.self, arguments: ["first": 10]),
          .field("vendor", String.self),
        ] }

        /// The description of the product, with
        /// HTML tags. For example, the description might include
        /// bold `<strong></strong>` and italic `<i></i>` text.
        public var descriptionHtml: Shopify.HTML { __data["descriptionHtml"] }
        /// A globally-unique ID.
        public var id: Shopify.ID { __data["id"] }
        /// The name for the product that displays to customers. The title is used to construct the product's handle.
        /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
        public var title: String { __data["title"] }
        /// A list of product options. The limit is defined by the
        /// [shop's resource limits for product options](https://shopify.dev/docs/api/admin-graphql/latest/objects/Shop#field-resourcelimits) (`Shop.resourceLimits.maxProductOptions`).
        public var options: [Option] { __data["options"] }
        /// The [product type](https://help.shopify.com/manual/products/details/product-type)
        /// that merchants define.
        public var productType: String { __data["productType"] }
        /// A list of [variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/ProductVariant) associated with the product.
        /// If querying a single product at the root, you can fetch up to 2000 variants.
        public var variants: Variants { __data["variants"] }
        /// The name of the product's vendor.
        public var vendor: String { __data["vendor"] }

        /// ProductVariantsBulkCreate.Product.Option
        ///
        /// Parent Type: `ProductOption`
        public struct Option: Shopify.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductOption }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
            .field("values", [String].self),
          ] }

          /// The product option’s name.
          public var name: String { __data["name"] }
          /// The corresponding value to the product option name.
          public var values: [String] { __data["values"] }
        }

        /// ProductVariantsBulkCreate.Product.Variants
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

          /// ProductVariantsBulkCreate.Product.Variants.Node
          ///
          /// Parent Type: `ProductVariant`
          public struct Node: Shopify.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductVariant }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Shopify.ID.self),
              .field("inventoryQuantity", Int?.self),
              .field("price", Shopify.Money.self),
              .field("title", String.self),
            ] }

            /// A globally-unique ID.
            public var id: Shopify.ID { __data["id"] }
            /// The total sellable quantity of the variant.
            public var inventoryQuantity: Int? { __data["inventoryQuantity"] }
            /// The price of the product variant in the default shop currency.
            public var price: Shopify.Money { __data["price"] }
            /// The title of the product variant.
            public var title: String { __data["title"] }
          }
        }
      }

      /// ProductVariantsBulkCreate.UserError
      ///
      /// Parent Type: `ProductVariantsBulkCreateUserError`
      public struct UserError: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductVariantsBulkCreateUserError }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("message", String.self),
          .field("field", [String]?.self),
        ] }

        /// The error message.
        public var message: String { __data["message"] }
        /// The path to the input field that caused the error.
        public var field: [String]? { __data["field"] }
      }
    }
  }
}

// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateProductVariantsMutation: GraphQLMutation {
  public static let operationName: String = "UpdateProductVariants"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateProductVariants($productId: ID!, $variants: [ProductVariantsBulkInput!]!) { productVariantsBulkUpdate(productId: $productId, variants: $variants) { __typename product { __typename variants(first: 100) { __typename nodes { __typename id title price } } } userErrors { __typename field message } } }"#
    ))

  public var productId: ID
  public var variants: [ProductVariantsBulkInput]

  public init(
    productId: ID,
    variants: [ProductVariantsBulkInput]
  ) {
    self.productId = productId
    self.variants = variants
  }

  public var __variables: Variables? { [
    "productId": productId,
    "variants": variants
  ] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("productVariantsBulkUpdate", ProductVariantsBulkUpdate?.self, arguments: [
        "productId": .variable("productId"),
        "variants": .variable("variants")
      ]),
    ] }

    /// Updates multiple variants in a single product. This mutation can be called directly or via the bulkOperation.
    public var productVariantsBulkUpdate: ProductVariantsBulkUpdate? { __data["productVariantsBulkUpdate"] }

    /// ProductVariantsBulkUpdate
    ///
    /// Parent Type: `ProductVariantsBulkUpdatePayload`
    public struct ProductVariantsBulkUpdate: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductVariantsBulkUpdatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("product", Product?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The updated product object.
      public var product: Product? { __data["product"] }
      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

      /// ProductVariantsBulkUpdate.Product
      ///
      /// Parent Type: `Product`
      public struct Product: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Product }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("variants", Variants.self, arguments: ["first": 100]),
        ] }

        /// A list of [variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/ProductVariant) associated with the product.
        /// If querying a single product at the root, you can fetch up to 2000 variants.
        public var variants: Variants { __data["variants"] }

        /// ProductVariantsBulkUpdate.Product.Variants
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

          /// ProductVariantsBulkUpdate.Product.Variants.Node
          ///
          /// Parent Type: `ProductVariant`
          public struct Node: Shopify.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductVariant }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Shopify.ID.self),
              .field("title", String.self),
              .field("price", Shopify.Money.self),
            ] }

            /// A globally-unique ID.
            public var id: Shopify.ID { __data["id"] }
            /// The title of the product variant.
            public var title: String { __data["title"] }
            /// The price of the product variant in the default shop currency.
            public var price: Shopify.Money { __data["price"] }
          }
        }
      }

      /// ProductVariantsBulkUpdate.UserError
      ///
      /// Parent Type: `ProductVariantsBulkUpdateUserError`
      public struct UserError: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductVariantsBulkUpdateUserError }
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

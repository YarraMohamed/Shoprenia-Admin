// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateProductOptionsMutation: GraphQLMutation {
  public static let operationName: String = "CreateProductOptions"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateProductOptions($id: ID!, $productOptions: [OptionCreateInput!]!) { productOptionsCreate(productId: $id, options: $productOptions) { __typename product { __typename id variants(first: 100) { __typename nodes { __typename id price title } } options(first: 10) { __typename id values name } } userErrors { __typename field message } } }"#
    ))

  public var id: ID
  public var productOptions: [OptionCreateInput]

  public init(
    id: ID,
    productOptions: [OptionCreateInput]
  ) {
    self.id = id
    self.productOptions = productOptions
  }

  public var __variables: Variables? { [
    "id": id,
    "productOptions": productOptions
  ] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("productOptionsCreate", ProductOptionsCreate?.self, arguments: [
        "productId": .variable("id"),
        "options": .variable("productOptions")
      ]),
    ] }

    /// Creates options on a product.
    public var productOptionsCreate: ProductOptionsCreate? { __data["productOptionsCreate"] }

    /// ProductOptionsCreate
    ///
    /// Parent Type: `ProductOptionsCreatePayload`
    public struct ProductOptionsCreate: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductOptionsCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("product", Product?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The updated product object.
      public var product: Product? { __data["product"] }
      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

      /// ProductOptionsCreate.Product
      ///
      /// Parent Type: `Product`
      public struct Product: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Product }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Shopify.ID.self),
          .field("variants", Variants.self, arguments: ["first": 100]),
          .field("options", [Option].self, arguments: ["first": 10]),
        ] }

        /// A globally-unique ID.
        public var id: Shopify.ID { __data["id"] }
        /// A list of [variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/ProductVariant) associated with the product.
        /// If querying a single product at the root, you can fetch up to 2000 variants.
        public var variants: Variants { __data["variants"] }
        /// A list of product options. The limit is defined by the
        /// [shop's resource limits for product options](https://shopify.dev/docs/api/admin-graphql/latest/objects/Shop#field-resourcelimits) (`Shop.resourceLimits.maxProductOptions`).
        public var options: [Option] { __data["options"] }

        /// ProductOptionsCreate.Product.Variants
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

          /// ProductOptionsCreate.Product.Variants.Node
          ///
          /// Parent Type: `ProductVariant`
          public struct Node: Shopify.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductVariant }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Shopify.ID.self),
              .field("price", Shopify.Money.self),
              .field("title", String.self),
            ] }

            /// A globally-unique ID.
            public var id: Shopify.ID { __data["id"] }
            /// The price of the product variant in the default shop currency.
            public var price: Shopify.Money { __data["price"] }
            /// The title of the product variant.
            public var title: String { __data["title"] }
          }
        }

        /// ProductOptionsCreate.Product.Option
        ///
        /// Parent Type: `ProductOption`
        public struct Option: Shopify.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductOption }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Shopify.ID.self),
            .field("values", [String].self),
            .field("name", String.self),
          ] }

          /// A globally-unique ID.
          public var id: Shopify.ID { __data["id"] }
          /// The corresponding value to the product option name.
          public var values: [String] { __data["values"] }
          /// The product option’s name.
          public var name: String { __data["name"] }
        }
      }

      /// ProductOptionsCreate.UserError
      ///
      /// Parent Type: `ProductOptionsCreateUserError`
      public struct UserError: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductOptionsCreateUserError }
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

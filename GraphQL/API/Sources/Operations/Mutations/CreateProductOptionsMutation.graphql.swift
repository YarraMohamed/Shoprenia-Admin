// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateProductOptionsMutation: GraphQLMutation {
  public static let operationName: String = "CreateProductOptions"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateProductOptions($id: ID!, $productOptions: [OptionCreateInput!]!) { productOptionsCreate(productId: $id, options: $productOptions) { __typename product { __typename bodyHtml options(first: 5) { __typename id name values } } } }"#
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
      ] }

      /// The updated product object.
      public var product: Product? { __data["product"] }

      /// ProductOptionsCreate.Product
      ///
      /// Parent Type: `Product`
      public struct Product: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Product }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("bodyHtml", String?.self),
          .field("options", [Option].self, arguments: ["first": 5]),
        ] }

        /// The description of the product, with
        /// HTML tags. For example, the description might include
        /// bold `<strong></strong>` and italic `<i></i>` text.
        @available(*, deprecated, message: "Use `descriptionHtml` instead.")
        public var bodyHtml: String? { __data["bodyHtml"] }
        /// A list of product options. The limit is defined by the
        /// [shop's resource limits for product options](https://shopify.dev/docs/api/admin-graphql/latest/objects/Shop#field-resourcelimits) (`Shop.resourceLimits.maxProductOptions`).
        public var options: [Option] { __data["options"] }

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
            .field("name", String.self),
            .field("values", [String].self),
          ] }

          /// A globally-unique ID.
          public var id: Shopify.ID { __data["id"] }
          /// The product option’s name.
          public var name: String { __data["name"] }
          /// The corresponding value to the product option name.
          public var values: [String] { __data["values"] }
        }
      }
    }
  }
}

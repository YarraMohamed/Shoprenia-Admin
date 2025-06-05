// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateProductMutation: GraphQLMutation {
  public static let operationName: String = "CreateProduct"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateProduct($product: ProductCreateInput!) { productCreate(product: $product) { __typename product { __typename id title descriptionHtml vendor productType options { __typename id name position optionValues { __typename id name hasVariants } } } userErrors { __typename field message } } }"#
    ))

  public var product: ProductCreateInput

  public init(product: ProductCreateInput) {
    self.product = product
  }

  public var __variables: Variables? { ["product": product] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("productCreate", ProductCreate?.self, arguments: ["product": .variable("product")]),
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
          .field("options", [Option].self),
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
        /// A list of product options. The limit is defined by the
        /// [shop's resource limits for product options](https://shopify.dev/docs/api/admin-graphql/latest/objects/Shop#field-resourcelimits) (`Shop.resourceLimits.maxProductOptions`).
        public var options: [Option] { __data["options"] }

        /// ProductCreate.Product.Option
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
            .field("position", Int.self),
            .field("optionValues", [OptionValue].self),
          ] }

          /// A globally-unique ID.
          public var id: Shopify.ID { __data["id"] }
          /// The product option’s name.
          public var name: String { __data["name"] }
          /// The product option's position.
          public var position: Int { __data["position"] }
          /// Similar to values, option_values returns all the corresponding option value objects to the product option, including values not assigned to any variants.
          public var optionValues: [OptionValue] { __data["optionValues"] }

          /// ProductCreate.Product.Option.OptionValue
          ///
          /// Parent Type: `ProductOptionValue`
          public struct OptionValue: Shopify.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductOptionValue }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Shopify.ID.self),
              .field("name", String.self),
              .field("hasVariants", Bool.self),
            ] }

            /// A globally-unique ID.
            public var id: Shopify.ID { __data["id"] }
            /// The name of the product option value.
            public var name: String { __data["name"] }
            /// Whether the product option value has any linked variants.
            public var hasVariants: Bool { __data["hasVariants"] }
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

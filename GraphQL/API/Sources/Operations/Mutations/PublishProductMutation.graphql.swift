// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PublishProductMutation: GraphQLMutation {
  public static let operationName: String = "PublishProduct"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation PublishProduct($productId: ID!, $publicationId: ID!) { publishablePublish(id: $productId, input: { publicationId: $publicationId }) { __typename publishable { __typename ... on Product { bodyHtml } } userErrors { __typename message field } } }"#
    ))

  public var productId: ID
  public var publicationId: ID

  public init(
    productId: ID,
    publicationId: ID
  ) {
    self.productId = productId
    self.publicationId = publicationId
  }

  public var __variables: Variables? { [
    "productId": productId,
    "publicationId": publicationId
  ] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("publishablePublish", PublishablePublish?.self, arguments: [
        "id": .variable("productId"),
        "input": ["publicationId": .variable("publicationId")]
      ]),
    ] }

    /// Publishes a resource to a channel. If the resource is a product, then it's visible in the channel only if the product status is `active`. Products that are sold exclusively on subscription (`requiresSellingPlan: true`) can be published only on online stores.
    public var publishablePublish: PublishablePublish? { __data["publishablePublish"] }

    /// PublishablePublish
    ///
    /// Parent Type: `PublishablePublishPayload`
    public struct PublishablePublish: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.PublishablePublishPayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("publishable", Publishable?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// Resource that has been published.
      public var publishable: Publishable? { __data["publishable"] }
      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

      /// PublishablePublish.Publishable
      ///
      /// Parent Type: `Publishable`
      public struct Publishable: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Interfaces.Publishable }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .inlineFragment(AsProduct.self),
        ] }

        public var asProduct: AsProduct? { _asInlineFragment() }

        /// PublishablePublish.Publishable.AsProduct
        ///
        /// Parent Type: `Product`
        public struct AsProduct: Shopify.InlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = PublishProductMutation.Data.PublishablePublish.Publishable
          public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Product }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("bodyHtml", String?.self),
          ] }

          /// The description of the product, with
          /// HTML tags. For example, the description might include
          /// bold `<strong></strong>` and italic `<i></i>` text.
          @available(*, deprecated, message: "Use `descriptionHtml` instead.")
          public var bodyHtml: String? { __data["bodyHtml"] }
        }
      }

      /// PublishablePublish.UserError
      ///
      /// Parent Type: `UserError`
      public struct UserError: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.UserError }
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

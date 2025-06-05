// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ProductCreateMediaMutation: GraphQLMutation {
  public static let operationName: String = "ProductCreateMedia"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation ProductCreateMedia($productId: ID!, $media: [CreateMediaInput!]!) { productCreateMedia(productId: $productId, media: $media) { __typename media { __typename alt mediaErrors { __typename message } ... on MediaImage { originalSource { __typename url } } } } }"#
    ))

  public var productId: ID
  public var media: [CreateMediaInput]

  public init(
    productId: ID,
    media: [CreateMediaInput]
  ) {
    self.productId = productId
    self.media = media
  }

  public var __variables: Variables? { [
    "productId": productId,
    "media": media
  ] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("productCreateMedia", ProductCreateMedia?.self, arguments: [
        "productId": .variable("productId"),
        "media": .variable("media")
      ]),
    ] }

    /// Creates media for a product.
    @available(*, deprecated, message: "Use `productUpdate` or `productSet` instead.")
    public var productCreateMedia: ProductCreateMedia? { __data["productCreateMedia"] }

    /// ProductCreateMedia
    ///
    /// Parent Type: `ProductCreateMediaPayload`
    public struct ProductCreateMedia: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductCreateMediaPayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("media", [Medium]?.self),
      ] }

      /// The newly created media.
      public var media: [Medium]? { __data["media"] }

      /// ProductCreateMedia.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Interfaces.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("alt", String?.self),
          .field("mediaErrors", [MediaError].self),
          .inlineFragment(AsMediaImage.self),
        ] }

        /// A word or phrase to share the nature or contents of a media.
        public var alt: String? { __data["alt"] }
        /// Any errors which have occurred on the media.
        public var mediaErrors: [MediaError] { __data["mediaErrors"] }

        public var asMediaImage: AsMediaImage? { _asInlineFragment() }

        /// ProductCreateMedia.Medium.MediaError
        ///
        /// Parent Type: `MediaError`
        public struct MediaError: Shopify.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.MediaError }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("message", String.self),
          ] }

          /// Translated error message.
          public var message: String { __data["message"] }
        }

        /// ProductCreateMedia.Medium.AsMediaImage
        ///
        /// Parent Type: `MediaImage`
        public struct AsMediaImage: Shopify.InlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = ProductCreateMediaMutation.Data.ProductCreateMedia.Medium
          public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.MediaImage }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("originalSource", OriginalSource?.self),
          ] }

          /// The original source of the image.
          public var originalSource: OriginalSource? { __data["originalSource"] }
          /// A word or phrase to share the nature or contents of a media.
          public var alt: String? { __data["alt"] }
          /// Any errors which have occurred on the media.
          public var mediaErrors: [MediaError] { __data["mediaErrors"] }

          /// ProductCreateMedia.Medium.AsMediaImage.OriginalSource
          ///
          /// Parent Type: `MediaImageOriginalSource`
          public struct OriginalSource: Shopify.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.MediaImageOriginalSource }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("url", Shopify.URL?.self),
            ] }

            /// The URL of the original image, valid only for a short period.
            public var url: Shopify.URL? { __data["url"] }
          }
        }
      }
    }
  }
}

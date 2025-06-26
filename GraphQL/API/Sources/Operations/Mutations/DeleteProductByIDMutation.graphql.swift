// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DeleteProductByIDMutation: GraphQLMutation {
  public static let operationName: String = "DeleteProductByID"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteProductByID($id: ID!) { productDelete(input: { id: $id }) { __typename deletedProductId userErrors { __typename field message } } }"#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("productDelete", ProductDelete?.self, arguments: ["input": ["id": .variable("id")]]),
    ] }

    /// Deletes a product, including all associated variants and media.
    ///
    /// As of API version `2023-01`, if you need to delete a large product, such as one that has many
    /// [variants](https://shopify.dev/api/admin-graphql/latest/input-objects/ProductVariantInput)
    /// that are active at several
    /// [locations](https://shopify.dev/api/admin-graphql/latest/input-objects/InventoryLevelInput),
    /// you may encounter timeout errors. To avoid these timeout errors, you can instead use the asynchronous
    /// [ProductDeleteAsync](https://shopify.dev/api/admin-graphql/latest/mutations/productDeleteAsync)
    /// mutation.
    public var productDelete: ProductDelete? { __data["productDelete"] }

    /// ProductDelete
    ///
    /// Parent Type: `ProductDeletePayload`
    public struct ProductDelete: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.ProductDeletePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("deletedProductId", Shopify.ID?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The ID of the deleted product.
      public var deletedProductId: Shopify.ID? { __data["deletedProductId"] }
      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

      /// ProductDelete.UserError
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

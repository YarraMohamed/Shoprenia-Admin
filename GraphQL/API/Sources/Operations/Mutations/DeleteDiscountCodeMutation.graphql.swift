// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DeleteDiscountCodeMutation: GraphQLMutation {
  public static let operationName: String = "DeleteDiscountCode"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteDiscountCode($ids: [ID!]!) { discountCodeBulkDelete(ids: $ids) { __typename userErrors { __typename code message } } }"#
    ))

  public var ids: [ID]

  public init(ids: [ID]) {
    self.ids = ids
  }

  public var __variables: Variables? { ["ids": ids] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("discountCodeBulkDelete", DiscountCodeBulkDelete?.self, arguments: ["ids": .variable("ids")]),
    ] }

    /// Deletes multiple [code-based discounts](https://help.shopify.com/manual/discounts/discount-types#discount-codes) asynchronously using one of the following:
    /// - A search query
    /// - A saved search ID
    /// - A list of discount code IDs
    ///
    /// For example, you can delete discounts for all codes that match a search criteria, or delete a predefined set of discount codes.
    public var discountCodeBulkDelete: DiscountCodeBulkDelete? { __data["discountCodeBulkDelete"] }

    /// DiscountCodeBulkDelete
    ///
    /// Parent Type: `DiscountCodeBulkDeletePayload`
    public struct DiscountCodeBulkDelete: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountCodeBulkDeletePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

      /// DiscountCodeBulkDelete.UserError
      ///
      /// Parent Type: `DiscountUserError`
      public struct UserError: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountUserError }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", GraphQLEnum<Shopify.DiscountErrorCode>?.self),
          .field("message", String.self),
        ] }

        /// The error code.
        public var code: GraphQLEnum<Shopify.DiscountErrorCode>? { __data["code"] }
        /// The error message.
        public var message: String { __data["message"] }
      }
    }
  }
}

// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SetInventoryQuantityMutation: GraphQLMutation {
  public static let operationName: String = "SetInventoryQuantity"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation SetInventoryQuantity($input: InventorySetQuantitiesInput!) { inventorySetQuantities(input: $input) { __typename userErrors { __typename field message } } }"#
    ))

  public var input: InventorySetQuantitiesInput

  public init(input: InventorySetQuantitiesInput) {
    self.input = input
  }

  public var __variables: Variables? { ["input": input] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("inventorySetQuantities", InventorySetQuantities?.self, arguments: ["input": .variable("input")]),
    ] }

    /// Set quantities of specified name using absolute values. This mutation supports compare-and-set functionality to handle
    /// concurrent requests properly. If `ignoreCompareQuantity` is not set to true,
    /// the mutation will only update the quantity if the persisted quantity matches the `compareQuantity` value.
    /// If the `compareQuantity` value does not match the persisted value, the mutation will return an error. In order to opt out
    /// of the `compareQuantity` check, the `ignoreCompareQuantity` argument can be set to true.
    ///
    /// > Note:
    /// > Only use this mutation if calling on behalf of a system that acts as the source of truth for inventory quantities,
    /// > otherwise please consider using the [inventoryAdjustQuantities](https://shopify.dev/api/admin-graphql/latest/mutations/inventoryAdjustQuantities) mutation.
    /// >
    /// >
    /// > Opting out of the `compareQuantity` check can lead to inaccurate inventory quantities if multiple requests are made concurrently.
    /// > It is recommended to always include the `compareQuantity` value to ensure the accuracy of the inventory quantities and to opt out
    /// > of the check using `ignoreCompareQuantity` only when necessary.
    public var inventorySetQuantities: InventorySetQuantities? { __data["inventorySetQuantities"] }

    /// InventorySetQuantities
    ///
    /// Parent Type: `InventorySetQuantitiesPayload`
    public struct InventorySetQuantities: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.InventorySetQuantitiesPayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

      /// InventorySetQuantities.UserError
      ///
      /// Parent Type: `InventorySetQuantitiesUserError`
      public struct UserError: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.InventorySetQuantitiesUserError }
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

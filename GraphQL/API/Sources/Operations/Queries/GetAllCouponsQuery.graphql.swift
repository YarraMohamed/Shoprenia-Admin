// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllCouponsQuery: GraphQLQuery {
  public static let operationName: String = "GetAllCoupons"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetAllCoupons { discountNodes(first: 100, reverse: true, sortKey: CREATED_AT) { __typename nodes { __typename id discount { __typename ... on DiscountCodeBasic { codes(first: 5) { __typename nodes { __typename id code } } summary title status startsAt endsAt asyncUsageCount customerGets { __typename value { __typename ... on DiscountAmount { amount { __typename amount } } ... on DiscountPercentage { percentage } } } } } } } }"#
    ))

  public init() {}

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("discountNodes", DiscountNodes.self, arguments: [
        "first": 100,
        "reverse": true,
        "sortKey": "CREATED_AT"
      ]),
    ] }

    /// Returns a list of discounts.
    public var discountNodes: DiscountNodes { __data["discountNodes"] }

    /// DiscountNodes
    ///
    /// Parent Type: `DiscountNodeConnection`
    public struct DiscountNodes: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountNodeConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node].self),
      ] }

      /// A list of nodes that are contained in DiscountNodeEdge. You can fetch data about an individual node, or you can follow the edges to fetch data about a collection of related nodes. At each node, you specify the fields that you want to retrieve.
      public var nodes: [Node] { __data["nodes"] }

      /// DiscountNodes.Node
      ///
      /// Parent Type: `DiscountNode`
      public struct Node: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountNode }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Shopify.ID.self),
          .field("discount", Discount.self),
        ] }

        /// A globally-unique ID.
        public var id: Shopify.ID { __data["id"] }
        /// A discount that's applied at checkout or on cart.
        ///
        ///
        /// Discounts can be [automatic or code-based](https://shopify.dev/docs/apps/build/discounts#discount-methods).
        public var discount: Discount { __data["discount"] }

        /// DiscountNodes.Node.Discount
        ///
        /// Parent Type: `Discount`
        public struct Discount: Shopify.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Shopify.Unions.Discount }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .inlineFragment(AsDiscountCodeBasic.self),
          ] }

          public var asDiscountCodeBasic: AsDiscountCodeBasic? { _asInlineFragment() }

          /// DiscountNodes.Node.Discount.AsDiscountCodeBasic
          ///
          /// Parent Type: `DiscountCodeBasic`
          public struct AsDiscountCodeBasic: Shopify.InlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = GetAllCouponsQuery.Data.DiscountNodes.Node.Discount
            public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountCodeBasic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("codes", Codes.self, arguments: ["first": 5]),
              .field("summary", String.self),
              .field("title", String.self),
              .field("status", GraphQLEnum<Shopify.DiscountStatus>.self),
              .field("startsAt", Shopify.DateTime.self),
              .field("endsAt", Shopify.DateTime?.self),
              .field("asyncUsageCount", Int.self),
              .field("customerGets", CustomerGets.self),
            ] }

            /// A list codes that customers can use to redeem the discount.
            public var codes: Codes { __data["codes"] }
            /// A detailed explanation of what the discount is,
            /// who can use it, when and where it applies, and any associated
            /// rules or limitations.
            public var summary: String { __data["summary"] }
            /// The discount's name that displays to merchants in the Shopify admin and to customers.
            public var title: String { __data["title"] }
            /// The status of the discount that describes its availability,
            /// expiration, or pending activation.
            public var status: GraphQLEnum<Shopify.DiscountStatus> { __data["status"] }
            /// The date and time when the discount becomes active and is available to customers.
            public var startsAt: Shopify.DateTime { __data["startsAt"] }
            /// The date and time when the discount expires and is no longer available to customers.
            /// For discounts without a fixed expiration date, specify `null`.
            public var endsAt: Shopify.DateTime? { __data["endsAt"] }
            /// The number of times that the discount has been used.
            /// For example, if a "Buy 3, Get 1 Free" t-shirt discount
            /// is automatically applied in 200 transactions, then the
            /// discount has been used 200 times.
            /// This value is updated asynchronously. As a result,
            /// it might be lower than the actual usage count until the
            /// asynchronous process is completed.
            public var asyncUsageCount: Int { __data["asyncUsageCount"] }
            /// The items in the order that qualify for the discount, their quantities, and the total value of the discount.
            public var customerGets: CustomerGets { __data["customerGets"] }

            /// DiscountNodes.Node.Discount.AsDiscountCodeBasic.Codes
            ///
            /// Parent Type: `DiscountRedeemCodeConnection`
            public struct Codes: Shopify.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountRedeemCodeConnection }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("nodes", [Node].self),
              ] }

              /// A list of nodes that are contained in DiscountRedeemCodeEdge. You can fetch data about an individual node, or you can follow the edges to fetch data about a collection of related nodes. At each node, you specify the fields that you want to retrieve.
              public var nodes: [Node] { __data["nodes"] }

              /// DiscountNodes.Node.Discount.AsDiscountCodeBasic.Codes.Node
              ///
              /// Parent Type: `DiscountRedeemCode`
              public struct Node: Shopify.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountRedeemCode }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("id", Shopify.ID.self),
                  .field("code", String.self),
                ] }

                /// A globally-unique ID of the discount redeem code.
                public var id: Shopify.ID { __data["id"] }
                /// The code that a customer can use at checkout to receive a discount.
                public var code: String { __data["code"] }
              }
            }

            /// DiscountNodes.Node.Discount.AsDiscountCodeBasic.CustomerGets
            ///
            /// Parent Type: `DiscountCustomerGets`
            public struct CustomerGets: Shopify.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountCustomerGets }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("value", Value.self),
              ] }

              /// Entitled quantity and the discount value.
              public var value: Value { __data["value"] }

              /// DiscountNodes.Node.Discount.AsDiscountCodeBasic.CustomerGets.Value
              ///
              /// Parent Type: `DiscountCustomerGetsValue`
              public struct Value: Shopify.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { Shopify.Unions.DiscountCustomerGetsValue }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .inlineFragment(AsDiscountAmount.self),
                  .inlineFragment(AsDiscountPercentage.self),
                ] }

                public var asDiscountAmount: AsDiscountAmount? { _asInlineFragment() }
                public var asDiscountPercentage: AsDiscountPercentage? { _asInlineFragment() }

                /// DiscountNodes.Node.Discount.AsDiscountCodeBasic.CustomerGets.Value.AsDiscountAmount
                ///
                /// Parent Type: `DiscountAmount`
                public struct AsDiscountAmount: Shopify.InlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = GetAllCouponsQuery.Data.DiscountNodes.Node.Discount.AsDiscountCodeBasic.CustomerGets.Value
                  public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountAmount }
                  public static var __selections: [ApolloAPI.Selection] { [
                    .field("amount", Amount.self),
                  ] }

                  /// The value of the discount.
                  public var amount: Amount { __data["amount"] }

                  /// DiscountNodes.Node.Discount.AsDiscountCodeBasic.CustomerGets.Value.AsDiscountAmount.Amount
                  ///
                  /// Parent Type: `MoneyV2`
                  public struct Amount: Shopify.SelectionSet {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.MoneyV2 }
                    public static var __selections: [ApolloAPI.Selection] { [
                      .field("__typename", String.self),
                      .field("amount", Shopify.Decimal.self),
                    ] }

                    /// A monetary value in decimal format, allowing for precise representation of cents or fractional
                    /// currency. For example, 12.99.
                    public var amount: Shopify.Decimal { __data["amount"] }
                  }
                }

                /// DiscountNodes.Node.Discount.AsDiscountCodeBasic.CustomerGets.Value.AsDiscountPercentage
                ///
                /// Parent Type: `DiscountPercentage`
                public struct AsDiscountPercentage: Shopify.InlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = GetAllCouponsQuery.Data.DiscountNodes.Node.Discount.AsDiscountCodeBasic.CustomerGets.Value
                  public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountPercentage }
                  public static var __selections: [ApolloAPI.Selection] { [
                    .field("percentage", Double.self),
                  ] }

                  /// The percentage value of the discount.
                  public var percentage: Double { __data["percentage"] }
                }
              }
            }
          }
        }
      }
    }
  }
}

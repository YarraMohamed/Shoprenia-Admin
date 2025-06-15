// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreatePercentageDiscountCodeMutation: GraphQLMutation {
  public static let operationName: String = "CreatePercentageDiscountCode"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreatePercentageDiscountCode($title: String!, $startsAt: DateTime!, $endsAt: DateTime!, $usageLimit: Int, $code: String!, $percentage: Float!, $appliesOncePerCustomer: Boolean!, $minSubtotal: Decimal) { discountCodeBasicCreate( basicCodeDiscount: { title: $title startsAt: $startsAt endsAt: $endsAt usageLimit: $usageLimit customerSelection: { all: true } code: $code customerGets: { value: { percentage: $percentage }, items: { all: true } } appliesOncePerCustomer: $appliesOncePerCustomer minimumRequirement: { subtotal: { greaterThanOrEqualToSubtotal: $minSubtotal } } } ) { __typename userErrors { __typename field message } codeDiscountNode { __typename id codeDiscount { __typename ... on DiscountCodeBasic { title status startsAt endsAt codes(first: 1) { __typename nodes { __typename code } } } } } } }"#
    ))

  public var title: String
  public var startsAt: DateTime
  public var endsAt: DateTime
  public var usageLimit: GraphQLNullable<Int>
  public var code: String
  public var percentage: Double
  public var appliesOncePerCustomer: Bool
  public var minSubtotal: GraphQLNullable<Decimal>

  public init(
    title: String,
    startsAt: DateTime,
    endsAt: DateTime,
    usageLimit: GraphQLNullable<Int>,
    code: String,
    percentage: Double,
    appliesOncePerCustomer: Bool,
    minSubtotal: GraphQLNullable<Decimal>
  ) {
    self.title = title
    self.startsAt = startsAt
    self.endsAt = endsAt
    self.usageLimit = usageLimit
    self.code = code
    self.percentage = percentage
    self.appliesOncePerCustomer = appliesOncePerCustomer
    self.minSubtotal = minSubtotal
  }

  public var __variables: Variables? { [
    "title": title,
    "startsAt": startsAt,
    "endsAt": endsAt,
    "usageLimit": usageLimit,
    "code": code,
    "percentage": percentage,
    "appliesOncePerCustomer": appliesOncePerCustomer,
    "minSubtotal": minSubtotal
  ] }

  public struct Data: Shopify.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("discountCodeBasicCreate", DiscountCodeBasicCreate?.self, arguments: ["basicCodeDiscount": [
        "title": .variable("title"),
        "startsAt": .variable("startsAt"),
        "endsAt": .variable("endsAt"),
        "usageLimit": .variable("usageLimit"),
        "customerSelection": ["all": true],
        "code": .variable("code"),
        "customerGets": [
          "value": ["percentage": .variable("percentage")],
          "items": ["all": true]
        ],
        "appliesOncePerCustomer": .variable("appliesOncePerCustomer"),
        "minimumRequirement": ["subtotal": ["greaterThanOrEqualToSubtotal": .variable("minSubtotal")]]
      ]]),
    ] }

    /// Creates an [amount off discount](https://help.shopify.com/manual/discounts/discount-types/percentage-fixed-amount) that's applied on a cart and at checkout when a customer enters a code. Amount off discounts can be a percentage off or a fixed amount off.
    ///
    /// > Note:
    /// > To create discounts that are automatically applied on a cart and at checkout, use the [`discountAutomaticBasicCreate`](https://shopify.dev/docs/api/admin-graphql/latest/mutations/discountAutomaticBasicCreate) mutation.
    public var discountCodeBasicCreate: DiscountCodeBasicCreate? { __data["discountCodeBasicCreate"] }

    /// DiscountCodeBasicCreate
    ///
    /// Parent Type: `DiscountCodeBasicCreatePayload`
    public struct DiscountCodeBasicCreate: Shopify.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountCodeBasicCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("userErrors", [UserError].self),
        .field("codeDiscountNode", CodeDiscountNode?.self),
      ] }

      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }
      /// The discount code that was created.
      public var codeDiscountNode: CodeDiscountNode? { __data["codeDiscountNode"] }

      /// DiscountCodeBasicCreate.UserError
      ///
      /// Parent Type: `DiscountUserError`
      public struct UserError: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountUserError }
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

      /// DiscountCodeBasicCreate.CodeDiscountNode
      ///
      /// Parent Type: `DiscountCodeNode`
      public struct CodeDiscountNode: Shopify.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountCodeNode }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Shopify.ID.self),
          .field("codeDiscount", CodeDiscount.self),
        ] }

        /// A globally-unique ID.
        public var id: Shopify.ID { __data["id"] }
        /// The underlying code discount object.
        public var codeDiscount: CodeDiscount { __data["codeDiscount"] }

        /// DiscountCodeBasicCreate.CodeDiscountNode.CodeDiscount
        ///
        /// Parent Type: `DiscountCode`
        public struct CodeDiscount: Shopify.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Shopify.Unions.DiscountCode }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .inlineFragment(AsDiscountCodeBasic.self),
          ] }

          public var asDiscountCodeBasic: AsDiscountCodeBasic? { _asInlineFragment() }

          /// DiscountCodeBasicCreate.CodeDiscountNode.CodeDiscount.AsDiscountCodeBasic
          ///
          /// Parent Type: `DiscountCodeBasic`
          public struct AsDiscountCodeBasic: Shopify.InlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = CreatePercentageDiscountCodeMutation.Data.DiscountCodeBasicCreate.CodeDiscountNode.CodeDiscount
            public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountCodeBasic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("title", String.self),
              .field("status", GraphQLEnum<Shopify.DiscountStatus>.self),
              .field("startsAt", Shopify.DateTime.self),
              .field("endsAt", Shopify.DateTime?.self),
              .field("codes", Codes.self, arguments: ["first": 1]),
            ] }

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
            /// A list codes that customers can use to redeem the discount.
            public var codes: Codes { __data["codes"] }

            /// DiscountCodeBasicCreate.CodeDiscountNode.CodeDiscount.AsDiscountCodeBasic.Codes
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

              /// DiscountCodeBasicCreate.CodeDiscountNode.CodeDiscount.AsDiscountCodeBasic.Codes.Node
              ///
              /// Parent Type: `DiscountRedeemCode`
              public struct Node: Shopify.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { Shopify.Objects.DiscountRedeemCode }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("code", String.self),
                ] }

                /// The code that a customer can use at checkout to receive a discount.
                public var code: String { __data["code"] }
              }
            }
          }
        }
      }
    }
  }
}

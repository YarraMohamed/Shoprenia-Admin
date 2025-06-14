// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateDiscountCodeMutation: GraphQLMutation {
  public static let operationName: String = "CreateDiscountCode"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateDiscountCode($title: String!, $startsAt: DateTime!, $endsAt: DateTime, $usageLimit: Int, $code: String!, $percentage: Float!, $minSubtotal: Decimal!) { discountCodeBasicCreate( basicCodeDiscount: { title: $title startsAt: $startsAt endsAt: $endsAt usageLimit: $usageLimit customerSelection: { all: true } code: $code customerGets: { value: { percentage: $percentage }, items: { all: true } } appliesOncePerCustomer: true minimumRequirement: { subtotal: { greaterThanOrEqualToSubtotal: $minSubtotal } } } ) { __typename codeDiscountNode { __typename id } userErrors { __typename field message } } }"#
    ))

  public var title: String
  public var startsAt: DateTime
  public var endsAt: GraphQLNullable<DateTime>
  public var usageLimit: GraphQLNullable<Int>
  public var code: String
  public var percentage: Double
  public var minSubtotal: Decimal

  public init(
    title: String,
    startsAt: DateTime,
    endsAt: GraphQLNullable<DateTime>,
    usageLimit: GraphQLNullable<Int>,
    code: String,
    percentage: Double,
    minSubtotal: Decimal
  ) {
    self.title = title
    self.startsAt = startsAt
    self.endsAt = endsAt
    self.usageLimit = usageLimit
    self.code = code
    self.percentage = percentage
    self.minSubtotal = minSubtotal
  }

  public var __variables: Variables? { [
    "title": title,
    "startsAt": startsAt,
    "endsAt": endsAt,
    "usageLimit": usageLimit,
    "code": code,
    "percentage": percentage,
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
        "appliesOncePerCustomer": true,
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
        .field("codeDiscountNode", CodeDiscountNode?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The discount code that was created.
      public var codeDiscountNode: CodeDiscountNode? { __data["codeDiscountNode"] }
      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

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
        ] }

        /// A globally-unique ID.
        public var id: Shopify.ID { __data["id"] }
      }

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
    }
  }
}

// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// The `DiscountAutomaticBasic` object lets you manage
  /// [amount off discounts](https://help.shopify.com/manual/discounts/discount-types/percentage-fixed-amount)
  /// that are automatically applied on a cart and at checkout. Amount off discounts give customers a
  /// fixed value or a percentage off the products in an order, but don't apply to shipping costs.
  ///
  /// The `DiscountAutomaticBasic` object stores information about automatic amount off discounts that apply to
  /// specific [products and variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountProducts),
  /// [collections](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountCollections),
  /// or [all items in a cart](https://shopify.dev/docs/api/admin-graphql/latest/objects/AllDiscountItems).
  ///
  /// Learn more about working with [Shopify's discount model](https://shopify.dev/docs/apps/build/discounts),
  /// including limitations and considerations.
  ///
  /// > Note:
  /// > The [`DiscountCodeBasic`](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountCodeBasic)
  /// object has similar functionality to the `DiscountAutomaticBasic` object, but customers need to enter a code to
  /// receive a discount.
  static let DiscountAutomaticBasic = ApolloAPI.Object(
    typename: "DiscountAutomaticBasic",
    implementedInterfaces: [],
    keyFields: nil
  )
}
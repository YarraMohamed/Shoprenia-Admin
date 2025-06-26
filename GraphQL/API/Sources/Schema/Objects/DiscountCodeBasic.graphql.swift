// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// The `DiscountCodeBasic` object lets you manage
  /// [amount off discounts](https://help.shopify.com/manual/discounts/discount-types/percentage-fixed-amount)
  /// that are applied on a cart and at checkout when a customer enters a code. Amount off discounts give customers a
  /// fixed value or a percentage off the products in an order, but don't apply to shipping costs.
  ///
  /// The `DiscountCodeBasic` object stores information about amount off code discounts that apply to
  /// specific [products and variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountProducts),
  /// [collections](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountCollections),
  /// or [all items in a cart](https://shopify.dev/docs/api/admin-graphql/latest/objects/AllDiscountItems).
  ///
  /// Learn more about working with [Shopify's discount model](https://shopify.dev/docs/apps/build/discounts),
  /// including limitations and considerations.
  ///
  /// > Note:
  /// > The [`DiscountAutomaticBasic`](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountAutomaticBasic)
  /// object has similar functionality to the `DiscountCodeBasic` object, but discounts are automatically applied,
  /// without the need for customers to enter a code.
  static let DiscountCodeBasic = ApolloAPI.Object(
    typename: "DiscountCodeBasic",
    implementedInterfaces: [],
    keyFields: nil
  )
}
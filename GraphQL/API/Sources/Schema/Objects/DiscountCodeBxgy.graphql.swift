// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// The `DiscountCodeBxgy` object lets you manage
  /// [buy X get Y discounts (BXGY)](https://help.shopify.com/manual/discounts/discount-types/buy-x-get-y)
  /// that are applied on a cart and at checkout when a customer enters a code. BXGY discounts incentivize customers
  /// by offering them additional items at a discounted price or for free when they purchase a specified quantity
  /// of items.
  ///
  /// The `DiscountCodeBxgy` object stores information about BXGY code discounts that apply to
  /// specific [products and variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountProducts),
  /// [collections](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountCollections),
  /// or [all items in a cart](https://shopify.dev/docs/api/admin-graphql/latest/objects/AllDiscountItems).
  ///
  /// Learn more about working with [Shopify's discount model](https://shopify.dev/docs/apps/build/discounts),
  /// including limitations and considerations.
  ///
  /// > Note:
  /// > The [`DiscountAutomaticBxgy`](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountAutomaticBxgy)
  /// object has similar functionality to the `DiscountCodeBxgy` object, but discounts are automatically applied,
  /// without the need for customers to enter a code.
  static let DiscountCodeBxgy = ApolloAPI.Object(
    typename: "DiscountCodeBxgy",
    implementedInterfaces: [],
    keyFields: nil
  )
}
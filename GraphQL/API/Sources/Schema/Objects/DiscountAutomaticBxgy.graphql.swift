// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// The `DiscountAutomaticBxgy` object lets you manage
  /// [buy X get Y discounts (BXGY)](https://help.shopify.com/manual/discounts/discount-types/buy-x-get-y)
  /// that are automatically applied on a cart and at checkout. BXGY discounts incentivize customers by offering
  /// them additional items at a discounted price or for free when they purchase a specified quantity of items.
  ///
  /// The `DiscountAutomaticBxgy` object stores information about automatic BXGY discounts that apply to
  /// specific [products and variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountProducts),
  /// [collections](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountCollections),
  /// or [all items in a cart](https://shopify.dev/docs/api/admin-graphql/latest/objects/AllDiscountItems).
  ///
  /// Learn more about working with [Shopify's discount model](https://shopify.dev/docs/apps/build/discounts),
  /// including limitations and considerations.
  ///
  /// > Note:
  /// > The [`DiscountCodeBxgy`](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountCodeBxgy)
  /// object has similar functionality to the `DiscountAutomaticBxgy` object, but customers need to enter a code to
  /// receive a discount.
  static let DiscountAutomaticBxgy = ApolloAPI.Object(
    typename: "DiscountAutomaticBxgy",
    implementedInterfaces: [
      Interfaces.HasEvents.self,
      Interfaces.Node.self
    ],
    keyFields: nil
  )
}
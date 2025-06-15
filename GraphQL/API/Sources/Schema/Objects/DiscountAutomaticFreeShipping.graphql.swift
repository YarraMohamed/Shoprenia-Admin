// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// The `DiscountAutomaticFreeShipping` object lets you manage
  /// [free shipping discounts](https://help.shopify.com/manual/discounts/discount-types/free-shipping)
  /// that are automatically applied on a cart and at checkout. Free shipping discounts are promotional deals that
  /// merchants offer to customers to waive shipping costs and encourage online purchases.
  ///
  /// The `DiscountAutomaticFreeShipping` object stores information about automatic free shipping discounts that apply to
  /// specific [products and variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountProducts),
  /// [collections](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountCollections),
  /// or [all items in a cart](https://shopify.dev/docs/api/admin-graphql/latest/objects/AllDiscountItems).
  ///
  /// Learn more about working with [Shopify's discount model](https://shopify.dev/docs/apps/build/discounts),
  /// including limitations and considerations.
  ///
  /// > Note:
  /// > The [`DiscountCodeFreeShipping`](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountCodeFreeShipping)
  /// object has similar functionality to the `DiscountAutomaticFreeShipping` object, but customers need to enter a code to
  /// receive a discount.
  static let DiscountAutomaticFreeShipping = ApolloAPI.Object(
    typename: "DiscountAutomaticFreeShipping",
    implementedInterfaces: [],
    keyFields: nil
  )
}
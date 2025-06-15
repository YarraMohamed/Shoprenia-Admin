// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// The `DiscountCodeFreeShipping` object lets you manage
  /// [free shipping discounts](https://help.shopify.com/manual/discounts/discount-types/free-shipping)
  /// that are applied on a cart and at checkout when a customer enters a code. Free shipping discounts are
  /// promotional deals that merchants offer to customers to waive shipping costs and encourage online purchases.
  ///
  /// The `DiscountCodeFreeShipping` object stores information about free shipping code discounts that apply to
  /// specific [products and variants](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountProducts),
  /// [collections](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountCollections),
  /// or [all items in a cart](https://shopify.dev/docs/api/admin-graphql/latest/objects/AllDiscountItems).
  ///
  /// Learn more about working with [Shopify's discount model](https://shopify.dev/docs/apps/build/discounts),
  /// including limitations and considerations.
  ///
  /// > Note:
  /// > The
  /// [`DiscountAutomaticFreeShipping`](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountAutomaticFreeShipping)
  /// object has similar functionality to the `DiscountCodeFreeShipping` object, but discounts are automatically applied,
  /// without the need for customers to enter a code.
  static let DiscountCodeFreeShipping = ApolloAPI.Object(
    typename: "DiscountCodeFreeShipping",
    implementedInterfaces: [],
    keyFields: nil
  )
}
// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// The `DiscountAutomaticApp` object stores information about automatic discounts
  /// that are managed by an app using
  /// [Shopify Functions](https://shopify.dev/docs/apps/build/functions).
  /// Use `DiscountAutomaticApp`when you need advanced, custom, or
  /// dynamic discount capabilities that aren't supported by
  /// [Shopify's native discount types](https://help.shopify.com/manual/discounts/discount-types).
  ///
  /// Learn more about creating
  /// [custom discount functionality](https://shopify.dev/docs/apps/build/discounts/build-discount-function).
  ///
  /// > Note:
  /// > The [`DiscountCodeApp`](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountCodeApp)
  /// object has similar functionality to the `DiscountAutomaticApp` object, with the exception that `DiscountCodeApp`
  /// stores information about discount codes that are managed by an app using Shopify Functions.
  static let DiscountAutomaticApp = ApolloAPI.Object(
    typename: "DiscountAutomaticApp",
    implementedInterfaces: [],
    keyFields: nil
  )
}
// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// The `DiscountCodeApp` object stores information about code discounts
  /// that are managed by an app using
  /// [Shopify Functions](https://shopify.dev/docs/apps/build/functions).
  /// Use `DiscountCodeApp` when you need advanced, custom, or
  /// dynamic discount capabilities that aren't supported by
  /// [Shopify's native discount types](https://help.shopify.com/manual/discounts/discount-types).
  ///
  /// Learn more about creating
  /// [custom discount functionality](https://shopify.dev/docs/apps/build/discounts/build-discount-function).
  ///
  /// > Note:
  /// > The [`DiscountAutomaticApp`](https://shopify.dev/docs/api/admin-graphql/latest/objects/DiscountAutomaticApp)
  /// object has similar functionality to the `DiscountCodeApp` object, with the exception that `DiscountAutomaticApp`
  /// stores information about automatic discounts that are managed by an app using Shopify Functions.
  static let DiscountCodeApp = ApolloAPI.Object(
    typename: "DiscountCodeApp",
    implementedInterfaces: [],
    keyFields: nil
  )
}
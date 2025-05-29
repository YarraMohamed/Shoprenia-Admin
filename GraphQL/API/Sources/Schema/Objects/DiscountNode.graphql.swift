// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// The `DiscountNode` object enables you to manage [discounts](https://help.shopify.com/manual/discounts), which are applied at checkout or on a cart.
  ///
  ///
  /// Discounts are a way for merchants to promote sales and special offers, or as customer loyalty rewards. Discounts can apply to [orders, products, or shipping](https://shopify.dev/docs/apps/build/discounts#discount-classes), and can be either automatic or code-based. For example, you can offer customers a buy X get Y discount that's automatically applied when purchases meet specific criteria. Or, you can offer discounts where customers have to enter a code to redeem an amount off discount on products, variants, or collections in a store.
  ///
  /// Learn more about working with [Shopify's discount model](https://shopify.dev/docs/apps/build/discounts),
  /// including related mutations, limitations, and considerations.
  static let DiscountNode = ApolloAPI.Object(
    typename: "DiscountNode",
    implementedInterfaces: [
      Interfaces.HasEvents.self,
      Interfaces.HasMetafieldDefinitions.self,
      Interfaces.HasMetafields.self,
      Interfaces.Node.self
    ],
    keyFields: nil
  )
}
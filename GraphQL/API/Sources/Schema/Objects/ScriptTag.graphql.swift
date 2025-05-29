// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// <div class="note"><h4>Theme app extensions</h4>
  ///   <p>Your app might not pass App Store review if it uses script tags instead of theme app extensions. All new apps, and apps that integrate with Online Store 2.0 themes, should use theme app extensions, such as app blocks or app embed blocks. Script tags are an alternative you can use with only vintage themes. <a href="/apps/online-store#what-integration-method-should-i-use" target="_blank">Learn more</a>.</p></div>
  ///
  /// <div class="note"><h4>Script tag deprecation</h4>
  ///   <p>Script tags will be sunset for the <b>Order status</b> page on August 28, 2025. <a href="https://www.shopify.com/plus/upgrading-to-checkout-extensibility">Upgrade to Checkout Extensibility</a> before this date. <a href="/docs/api/liquid/objects#script">Shopify Scripts</a> will continue to work alongside Checkout Extensibility until August 28, 2025.</p></div>
  ///
  ///
  /// A script tag represents remote JavaScript code that is loaded into the pages of a shop's storefront or the **Order status** page of checkout.
  static let ScriptTag = ApolloAPI.Object(
    typename: "ScriptTag",
    implementedInterfaces: [
      Interfaces.LegacyInteroperability.self,
      Interfaces.Node.self
    ],
    keyFields: nil
  )
}
// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields to claim ownership for Product features such as Bundles.
public struct ProductClaimOwnershipInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    bundles: GraphQLNullable<Bool> = nil
  ) {
    __data = InputDict([
      "bundles": bundles
    ])
  }

  /// Claiming ownership of bundles lets the app render a custom UI for the bundles' card on the
  /// products details page in the Shopify admin.
  ///
  /// Bundle ownership can only be claimed when creating the product. If you create `ProductVariantComponents`
  /// in any of its product variants, then the bundle ownership is automatically assigned to the app making the call.
  ///
  /// [Learn more](https://shopify.dev/docs/apps/selling-strategies/bundles/product-config).
  public var bundles: GraphQLNullable<Bool> {
    get { __data["bundles"] }
    set { __data["bundles"] = newValue }
  }
}

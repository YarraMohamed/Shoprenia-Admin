// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields required to create a product.
public struct ProductCreateInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    descriptionHtml: GraphQLNullable<String> = nil,
    handle: GraphQLNullable<String> = nil,
    seo: GraphQLNullable<SEOInput> = nil,
    productType: GraphQLNullable<String> = nil,
    category: GraphQLNullable<ID> = nil,
    tags: GraphQLNullable<[String]> = nil,
    templateSuffix: GraphQLNullable<String> = nil,
    giftCardTemplateSuffix: GraphQLNullable<String> = nil,
    title: GraphQLNullable<String> = nil,
    vendor: GraphQLNullable<String> = nil,
    giftCard: GraphQLNullable<Bool> = nil,
    collectionsToJoin: GraphQLNullable<[ID]> = nil,
    combinedListingRole: GraphQLNullable<GraphQLEnum<CombinedListingsRole>> = nil,
    metafields: GraphQLNullable<[MetafieldInput]> = nil,
    productOptions: GraphQLNullable<[OptionCreateInput]> = nil,
    status: GraphQLNullable<GraphQLEnum<ProductStatus>> = nil,
    requiresSellingPlan: GraphQLNullable<Bool> = nil,
    claimOwnership: GraphQLNullable<ProductClaimOwnershipInput> = nil
  ) {
    __data = InputDict([
      "descriptionHtml": descriptionHtml,
      "handle": handle,
      "seo": seo,
      "productType": productType,
      "category": category,
      "tags": tags,
      "templateSuffix": templateSuffix,
      "giftCardTemplateSuffix": giftCardTemplateSuffix,
      "title": title,
      "vendor": vendor,
      "giftCard": giftCard,
      "collectionsToJoin": collectionsToJoin,
      "combinedListingRole": combinedListingRole,
      "metafields": metafields,
      "productOptions": productOptions,
      "status": status,
      "requiresSellingPlan": requiresSellingPlan,
      "claimOwnership": claimOwnership
    ])
  }

  /// The description of the product, with HTML tags.
  /// For example, the description might include bold `<strong></strong>` and italic `<i></i>` text.
  public var descriptionHtml: GraphQLNullable<String> {
    get { __data["descriptionHtml"] }
    set { __data["descriptionHtml"] = newValue }
  }

  /// A unique, human-readable string of the product's title. A handle can contain letters, hyphens (`-`), and numbers, but no spaces.
  /// The handle is used in the online store URL for the product.
  /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
  public var handle: GraphQLNullable<String> {
    get { __data["handle"] }
    set { __data["handle"] = newValue }
  }

  /// The [SEO title and description](https://help.shopify.com/manual/promoting-marketing/seo/adding-keywords)
  /// that are associated with a product.
  public var seo: GraphQLNullable<SEOInput> {
    get { __data["seo"] }
    set { __data["seo"] = newValue }
  }

  /// The [product type](https://help.shopify.com/manual/products/details/product-type)
  /// that merchants define.
  public var productType: GraphQLNullable<String> {
    get { __data["productType"] }
    set { __data["productType"] = newValue }
  }

  /// The ID of the [category](https://shopify.github.io/product-taxonomy/releases/unstable/?categoryId=sg-4-17-2-17)
  /// that's associated with the product.
  public var category: GraphQLNullable<ID> {
    get { __data["category"] }
    set { __data["category"] = newValue }
  }

  /// A comma-separated list of searchable keywords that are
  /// associated with the product. For example, a merchant might apply the `sports`
  /// and `summer` tags to products that are associated with sportwear for summer.
  ///
  /// Updating `tags` overwrites any existing tags that were previously added to the product.
  /// To add new tags without overwriting existing tags, use the
  /// [`tagsAdd`](https://shopify.dev/api/admin-graphql/latest/mutations/tagsadd)
  /// mutation.
  public var tags: GraphQLNullable<[String]> {
    get { __data["tags"] }
    set { __data["tags"] = newValue }
  }

  /// The [theme template](https://shopify.dev/docs/storefronts/themes/architecture/templates) that's used when customers view a product in a store.
  public var templateSuffix: GraphQLNullable<String> {
    get { __data["templateSuffix"] }
    set { __data["templateSuffix"] = newValue }
  }

  /// The [theme template](https://shopify.dev/docs/storefronts/themes/architecture/templates) that's used when customers view a gift card in a store.
  public var giftCardTemplateSuffix: GraphQLNullable<String> {
    get { __data["giftCardTemplateSuffix"] }
    set { __data["giftCardTemplateSuffix"] = newValue }
  }

  /// The name for the product that displays to customers. The title is used to construct the product's handle.
  /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
  public var title: GraphQLNullable<String> {
    get { __data["title"] }
    set { __data["title"] = newValue }
  }

  /// The name of the product's vendor.
  public var vendor: GraphQLNullable<String> {
    get { __data["vendor"] }
    set { __data["vendor"] = newValue }
  }

  /// Whether the product is a gift card.
  public var giftCard: GraphQLNullable<Bool> {
    get { __data["giftCard"] }
    set { __data["giftCard"] = newValue }
  }

  /// A list of collection IDs to associate with the product.
  public var collectionsToJoin: GraphQLNullable<[ID]> {
    get { __data["collectionsToJoin"] }
    set { __data["collectionsToJoin"] = newValue }
  }

  /// The role of the product in a [combined listing](https://shopify.dev/apps/build/product-merchandising/combined-listings).
  public var combinedListingRole: GraphQLNullable<GraphQLEnum<CombinedListingsRole>> {
    get { __data["combinedListingRole"] }
    set { __data["combinedListingRole"] = newValue }
  }

  /// The [custom fields](https://shopify.dev/docs/apps/build/custom-data) to associate with the product
  /// for the purposes of adding and storing additional information.
  public var metafields: GraphQLNullable<[MetafieldInput]> {
    get { __data["metafields"] }
    set { __data["metafields"] = newValue }
  }

  /// A list of product options and option values. Maximum product options: three. There's no limit on the number of option values.
  public var productOptions: GraphQLNullable<[OptionCreateInput]> {
    get { __data["productOptions"] }
    set { __data["productOptions"] = newValue }
  }

  /// The [product status](https://help.shopify.com/manual/products/details/product-details-page#product-status),
  /// which controls visibility across all sales channels.
  public var status: GraphQLNullable<GraphQLEnum<ProductStatus>> {
    get { __data["status"] }
    set { __data["status"] = newValue }
  }

  /// Whether the product can only be purchased with
  /// a [selling plan](https://shopify.dev/docs/apps/build/purchase-options/subscriptions/selling-plans).
  /// Products that are sold on subscription (`requiresSellingPlan: true`) can be updated only for online stores.
  /// If you update a product to be subscription-only (`requiresSellingPlan:false`), then the product is unpublished from all channels except the online store.
  public var requiresSellingPlan: GraphQLNullable<Bool> {
    get { __data["requiresSellingPlan"] }
    set { __data["requiresSellingPlan"] = newValue }
  }

  /// The input field to enable an app to provide additional product features.
  /// For example, you can specify
  /// [`bundles: true`](https://shopify.dev/docs/api/admin-graphql/latest/input-objects/ProductClaimOwnershipInput#field-bundles)
  /// in the `claimOwnership` field to let an app add a
  /// [product configuration extension](https://shopify.dev/docs/apps/build/product-merchandising/bundles/product-configuration-extension/add-merchant-config-ui).
  public var claimOwnership: GraphQLNullable<ProductClaimOwnershipInput> {
    get { __data["claimOwnership"] }
    set { __data["claimOwnership"] = newValue }
  }
}

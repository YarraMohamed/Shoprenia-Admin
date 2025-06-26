// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for specifying a product variant to create as part of a variant bulk mutation.
public struct ProductVariantsBulkInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    barcode: GraphQLNullable<String> = nil,
    compareAtPrice: GraphQLNullable<Money> = nil,
    id: GraphQLNullable<ID> = nil,
    mediaSrc: GraphQLNullable<[String]> = nil,
    inventoryPolicy: GraphQLNullable<GraphQLEnum<ProductVariantInventoryPolicy>> = nil,
    inventoryQuantities: GraphQLNullable<[InventoryLevelInput]> = nil,
    inventoryItem: GraphQLNullable<InventoryItemInput> = nil,
    mediaId: GraphQLNullable<ID> = nil,
    metafields: GraphQLNullable<[MetafieldInput]> = nil,
    optionValues: GraphQLNullable<[VariantOptionValueInput]> = nil,
    price: GraphQLNullable<Money> = nil,
    taxable: GraphQLNullable<Bool> = nil,
    taxCode: GraphQLNullable<String> = nil,
    requiresComponents: GraphQLNullable<Bool> = nil
  ) {
    __data = InputDict([
      "barcode": barcode,
      "compareAtPrice": compareAtPrice,
      "id": id,
      "mediaSrc": mediaSrc,
      "inventoryPolicy": inventoryPolicy,
      "inventoryQuantities": inventoryQuantities,
      "inventoryItem": inventoryItem,
      "mediaId": mediaId,
      "metafields": metafields,
      "optionValues": optionValues,
      "price": price,
      "taxable": taxable,
      "taxCode": taxCode,
      "requiresComponents": requiresComponents
    ])
  }

  /// The value of the barcode associated with the product variant.
  public var barcode: GraphQLNullable<String> {
    get { __data["barcode"] }
    set { __data["barcode"] = newValue }
  }

  /// The compare-at price of the variant.
  public var compareAtPrice: GraphQLNullable<Money> {
    get { __data["compareAtPrice"] }
    set { __data["compareAtPrice"] = newValue }
  }

  /// Specifies the product variant to update or delete.
  public var id: GraphQLNullable<ID> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  /// The URL of the media to associate with the variant.
  public var mediaSrc: GraphQLNullable<[String]> {
    get { __data["mediaSrc"] }
    set { __data["mediaSrc"] = newValue }
  }

  /// Whether customers are allowed to place an order for the variant when it's out of stock. Defaults to `DENY`.
  public var inventoryPolicy: GraphQLNullable<GraphQLEnum<ProductVariantInventoryPolicy>> {
    get { __data["inventoryPolicy"] }
    set { __data["inventoryPolicy"] = newValue }
  }

  /// The inventory quantities at each location where the variant is stocked. The number of elements
  /// in the array of inventory quantities can't exceed the amount specified for the plan.
  /// Supported as input with the `productVariantsBulkCreate` mutation only.
  public var inventoryQuantities: GraphQLNullable<[InventoryLevelInput]> {
    get { __data["inventoryQuantities"] }
    set { __data["inventoryQuantities"] = newValue }
  }

  /// The inventory item associated with the variant, used for unit cost.
  public var inventoryItem: GraphQLNullable<InventoryItemInput> {
    get { __data["inventoryItem"] }
    set { __data["inventoryItem"] = newValue }
  }

  /// The ID of the media that's associated with the variant.
  public var mediaId: GraphQLNullable<ID> {
    get { __data["mediaId"] }
    set { __data["mediaId"] = newValue }
  }

  /// The additional customizable information about the product variant.
  public var metafields: GraphQLNullable<[MetafieldInput]> {
    get { __data["metafields"] }
    set { __data["metafields"] = newValue }
  }

  /// The custom properties that a shop owner uses to define product variants.
  public var optionValues: GraphQLNullable<[VariantOptionValueInput]> {
    get { __data["optionValues"] }
    set { __data["optionValues"] = newValue }
  }

  /// The price of the variant.
  public var price: GraphQLNullable<Money> {
    get { __data["price"] }
    set { __data["price"] = newValue }
  }

  /// Whether the variant is taxable.
  public var taxable: GraphQLNullable<Bool> {
    get { __data["taxable"] }
    set { __data["taxable"] = newValue }
  }

  /// The tax code associated with the variant.
  public var taxCode: GraphQLNullable<String> {
    get { __data["taxCode"] }
    set { __data["taxCode"] = newValue }
  }

  /// Whether a product variant requires components. The default value is `false`.
  /// If `true`, then the product variant can only be purchased as a parent bundle with components and it will be
  /// omitted from channels that don't support bundles.
  public var requiresComponents: GraphQLNullable<Bool> {
    get { __data["requiresComponents"] }
    set { __data["requiresComponents"] = newValue }
  }
}

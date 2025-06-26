// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for an inventory item.
public struct InventoryItemInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    sku: GraphQLNullable<String> = nil,
    cost: GraphQLNullable<Decimal> = nil,
    tracked: GraphQLNullable<Bool> = nil,
    countryCodeOfOrigin: GraphQLNullable<GraphQLEnum<CountryCode>> = nil,
    harmonizedSystemCode: GraphQLNullable<String> = nil,
    countryHarmonizedSystemCodes: GraphQLNullable<[CountryHarmonizedSystemCodeInput]> = nil,
    provinceCodeOfOrigin: GraphQLNullable<String> = nil,
    measurement: GraphQLNullable<InventoryItemMeasurementInput> = nil,
    requiresShipping: GraphQLNullable<Bool> = nil
  ) {
    __data = InputDict([
      "sku": sku,
      "cost": cost,
      "tracked": tracked,
      "countryCodeOfOrigin": countryCodeOfOrigin,
      "harmonizedSystemCode": harmonizedSystemCode,
      "countryHarmonizedSystemCodes": countryHarmonizedSystemCodes,
      "provinceCodeOfOrigin": provinceCodeOfOrigin,
      "measurement": measurement,
      "requiresShipping": requiresShipping
    ])
  }

  /// The SKU (stock keeping unit) of the inventory item.
  public var sku: GraphQLNullable<String> {
    get { __data["sku"] }
    set { __data["sku"] = newValue }
  }

  /// Unit cost associated with the inventory item, the currency is the shop's default currency.
  public var cost: GraphQLNullable<Decimal> {
    get { __data["cost"] }
    set { __data["cost"] = newValue }
  }

  /// Whether the inventory item is tracked.
  public var tracked: GraphQLNullable<Bool> {
    get { __data["tracked"] }
    set { __data["tracked"] = newValue }
  }

  /// The ISO 3166-1 alpha-2 country code of where the item originated from.
  public var countryCodeOfOrigin: GraphQLNullable<GraphQLEnum<CountryCode>> {
    get { __data["countryCodeOfOrigin"] }
    set { __data["countryCodeOfOrigin"] = newValue }
  }

  /// The harmonized system code of the inventory item. This must be a number between 6 and 13 digits.
  public var harmonizedSystemCode: GraphQLNullable<String> {
    get { __data["harmonizedSystemCode"] }
    set { __data["harmonizedSystemCode"] = newValue }
  }

  /// List of country-specific harmonized system codes.
  public var countryHarmonizedSystemCodes: GraphQLNullable<[CountryHarmonizedSystemCodeInput]> {
    get { __data["countryHarmonizedSystemCodes"] }
    set { __data["countryHarmonizedSystemCodes"] = newValue }
  }

  /// The ISO 3166-2 alpha-2 province code of where the item originated from.
  public var provinceCodeOfOrigin: GraphQLNullable<String> {
    get { __data["provinceCodeOfOrigin"] }
    set { __data["provinceCodeOfOrigin"] = newValue }
  }

  /// The measurements of an inventory item.
  public var measurement: GraphQLNullable<InventoryItemMeasurementInput> {
    get { __data["measurement"] }
    set { __data["measurement"] = newValue }
  }

  public var requiresShipping: GraphQLNullable<Bool> {
    get { __data["requiresShipping"] }
    set { __data["requiresShipping"] = newValue }
  }
}

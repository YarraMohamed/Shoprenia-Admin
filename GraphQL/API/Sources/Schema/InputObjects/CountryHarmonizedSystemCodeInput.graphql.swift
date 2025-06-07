// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields required to specify a harmonized system code.
public struct CountryHarmonizedSystemCodeInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    harmonizedSystemCode: String,
    countryCode: GraphQLEnum<CountryCode>
  ) {
    __data = InputDict([
      "harmonizedSystemCode": harmonizedSystemCode,
      "countryCode": countryCode
    ])
  }

  /// Country specific harmonized system code.
  public var harmonizedSystemCode: String {
    get { __data["harmonizedSystemCode"] }
    set { __data["harmonizedSystemCode"] = newValue }
  }

  /// The ISO 3166-1 alpha-2 country code for the country that issued the specified harmonized system code.
  public var countryCode: GraphQLEnum<CountryCode> {
    get { __data["countryCode"] }
    set { __data["countryCode"] = newValue }
  }
}

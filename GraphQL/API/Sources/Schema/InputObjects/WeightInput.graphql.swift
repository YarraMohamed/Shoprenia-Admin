// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for the weight unit and value inputs.
public struct WeightInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    value: Double,
    unit: GraphQLEnum<WeightUnit>
  ) {
    __data = InputDict([
      "value": value,
      "unit": unit
    ])
  }

  /// The weight value using the unit system specified with `weight_unit`.
  public var value: Double {
    get { __data["value"] }
    set { __data["value"] = newValue }
  }

  /// Unit of measurement for `value`.
  public var unit: GraphQLEnum<WeightUnit> {
    get { __data["unit"] }
    set { __data["unit"] = newValue }
  }
}

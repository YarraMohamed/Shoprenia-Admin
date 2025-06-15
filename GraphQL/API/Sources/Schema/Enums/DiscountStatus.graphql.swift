// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The status of the discount that describes its availability,
/// expiration, or pending activation.
public enum DiscountStatus: String, EnumType {
  /// The discount is currently available for use.
  case active = "ACTIVE"
  /// The discount has reached its end date and is no longer valid.
  case expired = "EXPIRED"
  /// The discount is set to become active at a future date.
  case scheduled = "SCHEDULED"
}

// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The possible product statuses.
public enum ProductStatus: String, EnumType {
  /// The product is ready to sell and can be published to sales channels and apps. Products with an active status aren't automatically published to sales channels, such as the online store, or apps. By default, existing products are set to active.
  case active = "ACTIVE"
  /// The product is no longer being sold and isn't available to customers on sales channels and apps.
  case archived = "ARCHIVED"
  /// The product isn't ready to sell and is unavailable to customers on sales channels and apps. By default, duplicated and unarchived products are set to draft.
  case draft = "DRAFT"
}

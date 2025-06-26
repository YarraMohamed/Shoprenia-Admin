// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The valid values for the inventory policy of a product variant once it is out of stock.
public enum ProductVariantInventoryPolicy: String, EnumType {
  /// Customers can't buy this product variant after it's out of stock.
  case deny = "DENY"
  /// Customers can buy this product variant after it's out of stock.
  case `continue` = "CONTINUE"
}

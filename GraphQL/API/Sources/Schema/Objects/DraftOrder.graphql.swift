// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// An order that a merchant creates on behalf of a customer. Draft orders are useful for merchants that need to do the following tasks:
  ///
  /// - Create new orders for sales made by phone, in person, by chat, or elsewhere. When a merchant accepts payment for a draft order, an order is created.
  /// - Send invoices to customers to pay with a secure checkout link.
  /// - Use custom items to represent additional costs or products that aren't displayed in a shop's inventory.
  /// - Re-create orders manually from active sales channels.
  /// - Sell products at discount or wholesale rates.
  /// - Take pre-orders.
  ///
  /// For draft orders in multiple currencies `presentment_money` is the source of truth for what a customer is going to be charged and `shop_money` is an estimate of what the merchant might receive in their shop currency.
  ///
  /// **Caution:** Only use this data if it's required for your app's functionality. Shopify will restrict [access to scopes](https://shopify.dev/api/usage/access-scopes) for apps that don't have a legitimate use for the associated data.
  ///
  /// Draft orders created on or after April 1, 2025 will be automatically purged after one year of inactivity.
  static let DraftOrder = ApolloAPI.Object(
    typename: "DraftOrder",
    implementedInterfaces: [
      Interfaces.CommentEventSubject.self,
      Interfaces.HasEvents.self,
      Interfaces.HasLocalizationExtensions.self,
      Interfaces.HasLocalizedFields.self,
      Interfaces.HasMetafields.self,
      Interfaces.LegacyInteroperability.self,
      Interfaces.Navigable.self,
      Interfaces.Node.self
    ],
    keyFields: nil
  )
}
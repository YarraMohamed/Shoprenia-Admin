// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// Represents information about a customer of the shop, such as the customer's contact details, their order
  /// history, and whether they've agreed to receive marketing material by email.
  ///
  /// **Caution:** Only use this data if it's required for your app's functionality. Shopify will restrict [access to scopes](https://shopify.dev/api/usage/access-scopes) for apps that don't have a legitimate use for the associated data.
  static let Customer = ApolloAPI.Object(
    typename: "Customer",
    implementedInterfaces: [
      Interfaces.CommentEventSubject.self,
      Interfaces.HasEvents.self,
      Interfaces.HasMetafieldDefinitions.self,
      Interfaces.HasMetafields.self,
      Interfaces.HasStoreCreditAccounts.self,
      Interfaces.LegacyInteroperability.self,
      Interfaces.Node.self
    ],
    keyFields: nil
  )
}
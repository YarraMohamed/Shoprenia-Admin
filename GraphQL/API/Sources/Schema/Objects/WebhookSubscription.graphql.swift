// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// A webhook subscription is a persisted data object created by an app using the REST Admin API or GraphQL Admin API.
  /// It describes the topic that the app wants to receive, and a destination where Shopify should send webhooks of the specified topic.
  /// When an event for a given topic occurs, the webhook subscription sends a relevant payload to the destination.
  /// Learn more about the [webhooks system](https://shopify.dev/apps/webhooks).
  static let WebhookSubscription = ApolloAPI.Object(
    typename: "WebhookSubscription",
    implementedInterfaces: [
      Interfaces.LegacyInteroperability.self,
      Interfaces.Node.self
    ],
    keyFields: nil
  )
}
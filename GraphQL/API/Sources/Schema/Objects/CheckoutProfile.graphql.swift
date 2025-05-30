// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// A checkout profile defines the branding settings and the UI extensions for a store's checkout. A checkout profile could be published or draft. A store might have at most one published checkout profile, which is used to render their live checkout. The store could also have multiple draft profiles that were created, previewed, and published using the admin checkout editor.
  static let CheckoutProfile = ApolloAPI.Object(
    typename: "CheckoutProfile",
    implementedInterfaces: [Interfaces.Node.self],
    keyFields: nil
  )
}
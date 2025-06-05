// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields required to create a media object.
public struct CreateMediaInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    originalSource: String,
    alt: GraphQLNullable<String> = nil,
    mediaContentType: GraphQLEnum<MediaContentType>
  ) {
    __data = InputDict([
      "originalSource": originalSource,
      "alt": alt,
      "mediaContentType": mediaContentType
    ])
  }

  /// The original source of the media object. This might be an external URL or a staged upload URL.
  public var originalSource: String {
    get { __data["originalSource"] }
    set { __data["originalSource"] = newValue }
  }

  /// The alt text associated with the media.
  public var alt: GraphQLNullable<String> {
    get { __data["alt"] }
    set { __data["alt"] = newValue }
  }

  /// The media content type.
  public var mediaContentType: GraphQLEnum<MediaContentType> {
    get { __data["mediaContentType"] }
    set { __data["mediaContentType"] = newValue }
  }
}

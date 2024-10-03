//
//  MyChromaUpdateCollectionRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaUpdateCollectionRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(collectionId: String, newName: String, newMetadata: AnyParams) {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init(newName: newName, newMetadata: newMetadata)
  }

  internal struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  internal struct Query: RequestQueries {}

  internal struct Body: Codable {
    var newName: String
    var newMetadata: AnyParams

    enum CodingKeys: String, CodingKey {
      case newName = "new_name"
      case newMetadata = "new_metadata"
    }
  }
}

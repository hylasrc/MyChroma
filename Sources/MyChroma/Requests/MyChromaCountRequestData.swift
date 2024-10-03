//
//  MyChromaCountRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaCountRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(collectionId: String) {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init()
  }

  internal struct Path: RequestPathVariables {
    var collectionId: String

    internal func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  internal struct Query: RequestQueries {}

  internal struct Body: Codable {}
}

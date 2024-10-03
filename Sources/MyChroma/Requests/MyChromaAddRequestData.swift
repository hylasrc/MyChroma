//
//  MyChromaAddRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaAddRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(collectionId: String, embeddings: [[Float]], metadatas: [AnyParams], documents: [String], uris: [String], ids: [String]) {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init(embeddings: embeddings, metadatas: metadatas, documents: documents, uris: uris, ids: ids)
  }

  internal struct Path: RequestPathVariables {
    var collectionId: String

    public func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  internal struct Query: RequestQueries {}

  internal struct Body: Codable {
    public var embeddings: [[Float]]
    public var metadatas: [AnyParams]
    public var documents: [String]
    public var uris: [String]
    public var ids: [String]
  }
}

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
  public init(collectionId: String, ids: [String], embeddings: [[Double]], metadatas: [AnyParams], documents: [String], uris: [String] = []) {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init(ids: ids, embeddings: embeddings.asFloatArray(), metadatas: metadatas, documents: documents, uris: uris)
  }

  public init(collectionId: String, ids: [String], embeddings: [[Float]], metadatas: [AnyParams], documents: [String], uris: [String] = []) {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init(ids: ids, embeddings: embeddings, metadatas: metadatas, documents: documents, uris: uris)
  }

  internal struct Path: RequestPathVariables {
    var collectionId: String

    public func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  internal struct Query: RequestQueries {}

  internal struct Body: Codable {
    public var ids: [String]
    public var embeddings: [[Float]]
    public var metadatas: [AnyParams]
    public var documents: [String]
    public var uris: [String]
  }
}

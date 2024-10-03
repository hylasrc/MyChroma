//
//  MyChromaUpsertRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaUpsertRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(
    collectionId: String, embeddings: [String], metadatas: [AnyParams],
    documents: [String], uris: [String], ids: [String])
  {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init(embeddings: embeddings, metadatas: metadatas, documents: documents, uris: uris, ids: ids)
  }

  internal struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  internal struct Query: RequestQueries {}

  internal struct Body: Codable {
    var embeddings: [String]
    var metadatas: [AnyParams]
    var documents: [String]
    var uris: [String]
    var ids: [String]
  }
}

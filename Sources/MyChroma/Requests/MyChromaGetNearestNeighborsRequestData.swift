//
//  MyChromaGetNearestNeighborsRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//
public enum Include: String, CaseIterable, Codable {
  case metadatas, documents, distances, embeddings
}

public struct MyChromaGetNearestNeighborsRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(
    collectionId: String, where: AnyParams, whereDocument: AnyParams, queryEmbeddings: [String],
    nResults: Int, include: [Include] = Include.allCases)
  {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init(where: `where`, whereDocument: whereDocument, queryEmbeddings: queryEmbeddings, nResults: nResults, include: include)
  }

  internal struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  internal struct Query: RequestQueries {}

  internal struct Body: Codable {
    var `where`: AnyParams
    var whereDocument: AnyParams
    var queryEmbeddings: [String]
    var nResults: Int
    var include: [Include]
  }
}

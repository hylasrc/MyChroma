//
//  MyChromaGetRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaGetRequestData {
  var path: Self.Path
  var queries: Self.Query
  var body: Self.Body

  public init(
    collectionId: String, ids: [String]? = nil, where: AnyParams? = nil, whereDocument: AnyParams? = nil,
    sort: String? = nil, offset: Int? = nil, limit: Int? = nil, include: [MyChroma.Include] = [.metadatas, .documents, .embeddings]
  ) {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init(ids: ids, where: `where`, whereDocument: whereDocument, sort: sort, limit: limit, offset: offset, include: include)
  }

  struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  struct Query: RequestQueries {}

  struct Body: Codable {
    var ids: [String]?
    var `where`: AnyParams?
    var whereDocument: AnyParams?
    var sort: String?
    var limit: Int?
    var offset: Int?
    var include: [MyChroma.Include]

    enum CodingKeys: String, CodingKey {
      case ids
      case `where`
      case whereDocument = "where_document"
      case sort
      case limit
      case offset
      case include
    }
  }
}

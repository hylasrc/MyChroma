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
    collectionId: String, ids: [String]? = nil, where: [String: Encodable]?, whereDocument: [String: Encodable]?,
    sort: String? = nil, offset: Int? = nil, limit: Int? = 10, include: [MyChroma.Include] = [.metadatas, .documents, .embeddings]
  ) {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init(ids: ids, where: AnyEncodable(`where`), whereDocument: AnyEncodable(whereDocument),
                 sort: sort, limit: limit, offset: offset, include: include)
  }

  public init(
    collectionId: String, ids: [String]? = nil, where: Where? = nil, whereDocument: WhereDocument? = nil,
    sort: String? = nil, offset: Int? = nil, limit: Int? = 10, include: [MyChroma.Include] = [.metadatas, .documents, .embeddings]
  ) {
    self.init(collectionId: collectionId, where: `where`?.build(), whereDocument: whereDocument?.build(),
              sort: sort, offset: offset, limit: limit, include: include)
  }

  struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  struct Query: RequestQueries {}

  struct Body: Encodable {
    var ids: [String]?
    var `where`: AnyEncodable?
    var whereDocument: AnyEncodable?
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

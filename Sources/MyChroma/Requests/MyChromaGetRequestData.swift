//
//  MyChromaGetRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaGetRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(collectionId: String, ids: [String], where: AnyParams, whereDocument: AnyParams, sort: String, limit: Int, offset: Int, include: [String]) {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init(ids: ids, where: `where`, whereDocument: whereDocument, sort: sort, limit: limit, offset: offset, include: include)
  }

  internal struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  internal struct Query: RequestQueries {}

  internal struct Body: Codable {
    var ids: [String]
    var `where`: AnyParams
    var whereDocument: AnyParams
    var sort: String
    var limit: Int
    var offset: Int
    var include: [String]
  }
}

//
//  MyChromaDeleteRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaDeleteRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(collectionId: String, ids: [String], where: AnyParams, whereDocument: AnyParams) {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init(ids: ids, where: `where`, whereDocument: whereDocument)
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
    
    enum CodingKeys: String, CodingKey {
      case ids
      case `where`
      case whereDocument = "where_document"
    }
  }
}

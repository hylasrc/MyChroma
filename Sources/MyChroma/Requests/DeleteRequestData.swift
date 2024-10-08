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

  public init(collectionId: String, ids: [String], where: [String: Encodable]?, whereDocument: [String: Encodable]?) {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init(ids: ids, where: AnyEncodable(`where`), whereDocument: AnyEncodable(whereDocument))
  }

  public init(collectionId: String, ids: [String], where: Where? = nil, whereDocument: WhereDocument? = nil) {
    self.init(collectionId: collectionId, ids: ids, where: `where`?.build(), whereDocument: whereDocument?.build())
  }

  internal struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  internal struct Query: RequestQueries {}

  internal struct Body: Encodable {
    var ids: [String]
    var `where`: AnyEncodable?
    var whereDocument: AnyEncodable?

    enum CodingKeys: String, CodingKey {
      case ids
      case `where`
      case whereDocument = "where_document"
    }
  }
}

//
//  MyChromaListCollectionsRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

import Foundation

public struct MyChromaListCollectionsRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(tenant: String = defaultTenant, database: String = defaultDatabase, offset: Int = 0, limit: Int = 10) {
    path = .init()
    queries = .init(limit: limit, offset: offset, tenant: tenant, database: database)
    body = .init()
  }

  internal struct Path: RequestPathVariables {}

  internal struct Query: RequestQueries {
    var limit: Int
    var offset: Int
    var tenant: String
    var database: String

    func populate(_ url: URL) -> URL {
      url.appending(queryItems: [
        .init(name: "limit", value: String(limit)),
        .init(name: "offset", value: String(offset)),
        .init(name: "tenant", value: tenant),
        .init(name: "database", value: database),
      ])
    }
  }

  internal struct Body: Encodable {}
}

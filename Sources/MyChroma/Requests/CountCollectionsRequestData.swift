//
//  MyChromaCountCollectionsRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

import Foundation

public struct MyChromaCountCollectionsRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(tenant: String = defaultTenant, database: String = defaultDatabase) {
    path = .init()
    queries = .init(tenant: tenant, database: database)
    body = .init()
  }

  internal struct Path: RequestPathVariables {}

  internal struct Query: RequestQueries {
    var tenant: String
    var database: String

    func populate(_ url: URL) -> URL {
      url.appending(queryItems: [
        .init(name: "tenant", value: tenant),
        .init(name: "database", value: database),
      ])
    }
  }

  internal struct Body: Encodable {}
}

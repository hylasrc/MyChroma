//
//  MyChromaGetDatabaseRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

import Foundation

public struct MyChromaGetDatabaseRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(database: String, tenant: String) {
    path = .init(database: database)
    queries = .init(tenant: tenant)
    body = .init()
  }

  internal struct Path: RequestPathVariables {
    var database: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{database}", with: database)
    }
  }

  internal struct Query: RequestQueries {
    var tenant: String

    func populate(_ url: URL) -> URL {
      url.appending(queryItems: [.init(name: "tenant", value: tenant)])
    }
  }

  internal struct Body: Codable {}
}

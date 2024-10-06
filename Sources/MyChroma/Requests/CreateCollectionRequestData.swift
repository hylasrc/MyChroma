//
//  MyChromaCreateCollectionRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

import Foundation

public struct MyChromaCreateCollectionRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(
    tenant: String = defaultTenant, database: String = defaultDatabase,
    name: String, configuration: AnyParams, metadata: AnyParams, getOrCreate: Bool = false)
  {
    path = .init()
    queries = .init(tenant: tenant, database: database)
    body = .init(name: name, configuration: configuration, metadata: metadata, getOrCreate: getOrCreate)
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

  internal struct Body: Codable {
    var name: String
    var configuration: AnyParams
    var metadata: AnyParams
    var getOrCreate: Bool

    internal enum CodingKeys: String, CodingKey {
      case name
      case configuration
      case metadata
      case getOrCreate = "get_or_create"
    }
  }
}

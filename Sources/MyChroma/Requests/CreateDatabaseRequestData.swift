//
//  MyChromaCreateDatabaseRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

import Foundation

public struct MyChromaCreateDatabaseRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(tenant: String = defaultTenant, name: String) {
    path = .init()
    queries = .init(name: name)
    body = .init(tenant: tenant)
  }

  internal struct Path: RequestPathVariables {}

  internal struct Query: RequestQueries {
    var name: String

    func populate(_ url: URL) -> URL {
      url.appending(queryItems: [.init(name: "name", value: name)])
    }
  }

  internal struct Body: Encodable {
    var tenant: String
  }
}

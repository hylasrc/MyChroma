//
//  MyChromaCreateTenantRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaCreateTenantRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(name: String) {
    path = .init()
    queries = .init()
    body = .init(name: name)
  }

  internal struct Path: RequestPathVariables {}

  internal struct Query: RequestQueries {}

  internal struct Body: Codable {
    var name: String
  }
}

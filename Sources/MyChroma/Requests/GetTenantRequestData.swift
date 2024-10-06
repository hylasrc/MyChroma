//
//  MyChromaGetTenantRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaGetTenantRequestData {
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(tenant: String = defaultTenant) {
    path = .init(tenant: tenant)
    queries = .init()
    body = .init()
  }

  internal struct Path: RequestPathVariables {
    var tenant: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{tenant}", with: tenant)
    }
  }

  internal struct Query: RequestQueries {}

  internal struct Body: Codable {}
}

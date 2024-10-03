import Foundation

public typealias AnyParams = [String: AnyCodable]

@usableFromInline
internal let defaultTenant = "default_tenant"
@usableFromInline
internal let defaultDatabase = "default_database"

protocol RequestPathVariables {
  func populate(_ rawUrl: String) -> String
}

extension RequestPathVariables {
  func populate(_ rawUrl: String) -> String { rawUrl }
}

protocol RequestQueries {
  func populate(_ url: URL) -> URL
}

extension RequestQueries {
  func populate(_ url: URL) -> URL { url }
}

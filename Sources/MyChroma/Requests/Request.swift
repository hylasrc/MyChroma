import Foundation

public typealias AnyParams = [String: AnyCodable]

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

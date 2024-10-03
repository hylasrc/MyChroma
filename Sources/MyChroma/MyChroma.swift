//
//  MyChroma.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/1.
//

public struct MyChroma {
  @usableFromInline
  internal static let defaultBaseURL = "http://localhost:8000"

  public let baseURL: String
  internal let http: MyChromaHTTPClient = .shared

  public init(_ baseURL: String = MyChroma.defaultBaseURL) {
    self.baseURL = baseURL
  }

  internal func requestAPINoResp(_ api: MyChromaAPI) async throws {
    try await http.send(request: api.asURLRequest(baseURL))
  }

  internal func requestAPI<T: Decodable>(_ api: MyChromaAPI, with: T.Type = T.self) async throws -> T {
    try await http.send(request: api.asURLRequest(baseURL), with: T.self)
  }
}

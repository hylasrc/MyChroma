public struct MyChroma {
  public let baseURL: String
  internal let http: MyChromaHTTPClient = .shared

  public init(_ baseURL: String) {
    self.baseURL = baseURL
  }

  internal func requestAPI<T: Decodable>(_ api: MyChromaAPI, with: T.Type = T.self) async throws -> T {
    try await http.send(request: api.asURLRequest(baseURL), with: T.self)
  }
}

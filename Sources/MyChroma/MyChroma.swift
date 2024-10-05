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
    // let req = api.asURLRequest(baseURL)
    // let headers = req.allHTTPHeaderFields ?? [:]
    // if let method = req.httpMethod {
    //   debugPrint("========================================")
    //   if let body = req.httpBody, let bodyString = String(data: body, encoding: .utf8) {
    //     debugPrint("\(method) \(req.description)\n\(headers)\n\(bodyString)")
    //   } else {
    //     debugPrint("\(method) \(req.description)\n\(headers)")
    //   }
    //   debugPrint("========================================")
    // }
    return try await http.send(request: api.asURLRequest(baseURL), with: T.self)
  }
}

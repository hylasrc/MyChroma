//
//  MyChromaHTTPClient+URLRequest.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

import Combine
import Foundation

extension MyChromaHTTPClient {
  func send(request: URLRequest) async throws {
    let (_, response) = try await URLSession.shared.data(for: request)
    try validate(data: nil, response: response)
  }

  func send<T: Decodable>(request: URLRequest, with responseType: T.Type) async throws -> T {
    let (data, response) = try await URLSession.shared.data(for: request)
    try validate(data: data, response: response)
    return try decoder.decode(T.self, from: data)
  }
}

extension MyChromaHTTPClient {
  func send<T: Decodable>(request: URLRequest, with responseType: T.Type) -> AnyPublisher<T, Error> {
    return URLSession.shared.dataTaskPublisher(for: request)
      .tryMap { data, response in
        try self.validate(data: nil, response: response)

        return data
      }
      .decode(type: T.self, decoder: decoder)
      .eraseToAnyPublisher()
  }

  func send(request: URLRequest) -> AnyPublisher<Void, Error> {
    return URLSession.shared.dataTaskPublisher(for: request)
      .tryMap { _, response in
        try self.validate(data: nil, response: response)

        return ()
      }
      .eraseToAnyPublisher()
  }
}

private extension MyChromaHTTPClient {
  func validate(data: Data?, response: URLResponse) throws {
    guard let httpResponse = response as? HTTPURLResponse, (200 ... 299).contains(httpResponse.statusCode) else {
      let userInfo: [String: AnyCodable] = if let data {
        try decoder.decode([String: AnyCodable].self, from: data)
      } else {
        [:]
      }
      throw URLError(.badServerResponse, userInfo: userInfo)
    }
  }
}

import Combine
import Foundation

struct MyChromaHTTPClient {
  private let decoder: JSONDecoder = .init()
  static let shared = MyChromaHTTPClient()
}

extension MyChromaHTTPClient {
  func send(request: URLRequest) async throws {
    let (_, response) = try await URLSession.shared.data(for: request)
    try validate(response: response)
  }
    
  func send<T: Decodable>(request: URLRequest, with responseType: T.Type) async throws -> T {
    let (data, response) = try await URLSession.shared.data(for: request)
    try validate(response: response)
    return try decoder.decode(T.self, from: data)
  }
}

extension MyChromaHTTPClient {
  func send<T: Decodable>(request: URLRequest, with responseType: T.Type) -> AnyPublisher<T, Error> {
    return URLSession.shared.dataTaskPublisher(for: request)
      .tryMap { data, response in
        try self.validate(response: response)
                
        return data
      }
      .decode(type: T.self, decoder: decoder)
      .eraseToAnyPublisher()
  }
    
  func send(request: URLRequest) -> AnyPublisher<Void, Error> {
    return URLSession.shared.dataTaskPublisher(for: request)
      .tryMap { _, response in
        try self.validate(response: response)
                
        return ()
      }
      .eraseToAnyPublisher()
  }
}

private extension MyChromaHTTPClient {
  func validate(response: URLResponse) throws {
    guard let httpResponse = response as? HTTPURLResponse, (200 ... 299).contains(httpResponse.statusCode) else {
      throw URLError(.badServerResponse)
    }
  }
    
  func extractNextJSON(from buffer: inout Data) -> Data? {
    var isEscaped = false
    var isWithinString = false
    var nestingDepth = 0
    var objectStartIndex = buffer.startIndex
        
    for (index, byte) in buffer.enumerated() {
      let character = Character(UnicodeScalar(byte))
            
      if isEscaped {
        isEscaped = false
      } else if character == "\\" {
        isEscaped = true
      } else if character == "\"" {
        isWithinString.toggle()
      } else if !isWithinString {
        switch character {
        case "{":
          nestingDepth += 1
          if nestingDepth == 1 {
            objectStartIndex = index
          }
        case "}":
          nestingDepth -= 1
          if nestingDepth == 0 {
            let range = objectStartIndex ..< buffer.index(after: index)
            let jsonObject = buffer.subdata(in: range)
            buffer.removeSubrange(range)
                        
            return jsonObject
          }
        default:
          break
        }
      }
    }
        
    return nil
  }
}

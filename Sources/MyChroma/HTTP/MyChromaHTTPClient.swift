import Combine
import Foundation

extension JSONDecoder {
  static let shared = JSONDecoder()
}

struct MyChromaHTTPClient {
  let decoder: JSONDecoder = .shared
}

extension MyChromaHTTPClient {
  static let shared = MyChromaHTTPClient()
}

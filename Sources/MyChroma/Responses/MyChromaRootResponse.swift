public struct MyChromaRootResponse: Decodable {
  public let nanosecondHeartbeat: Int64?

  internal enum CodingKeys: String, CodingKey {
    case nanosecondHeartbeat = "nanosecond heartbeat"
  }
}

// public struct MyChromaAddResponse: Decodable {
//   public let result: AnyCodable
// }
//
// public struct MyChromaUpdateResponse: Decodable {
//   public let result: AnyCodable
// }
//
// public struct MyChromaUpsertResponse: Decodable {
//   public let result: AnyCodable
// }
//
// public struct MyChromaGetResponse: Decodable {
//   public let result: AnyCodable
// }

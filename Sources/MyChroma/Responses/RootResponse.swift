public struct MyChromaRootResponse: Decodable {
  public let nanosecondHeartbeat: Int64?

  internal enum CodingKeys: String, CodingKey {
    case nanosecondHeartbeat = "nanosecond heartbeat"
  }
}

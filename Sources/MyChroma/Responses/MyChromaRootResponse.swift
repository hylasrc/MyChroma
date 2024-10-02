public struct MyChromaRootResponse: Decodable {
  public let nanosecondHeartbeat: Int64?

  enum CodingKeys: CodingKey {
    case nanosecondHeartbeat

    public var stringValue: String {
      switch self {
      case .nanosecondHeartbeat: "nanosecond heartbeat"
      }
    }
  }
}

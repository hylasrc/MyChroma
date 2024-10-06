//
//  MyChromaHeartbeatResponse.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaHeartbeatResponse: Decodable {
  public let nanosecondHeartbeat: Int64?

  internal enum CodingKeys: String, CodingKey {
    case nanosecondHeartbeat = "nanosecond heartbeat"
  }
}

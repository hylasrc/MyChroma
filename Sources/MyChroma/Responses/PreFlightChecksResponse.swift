//
//  MyChromaPreFlightChecksResponse.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaPreFlightChecksResponse: Decodable {
  public let maxBatchSize: Int

  internal enum CodingKeys: String, CodingKey {
    case maxBatchSize = "max_batch_size"
  }
}

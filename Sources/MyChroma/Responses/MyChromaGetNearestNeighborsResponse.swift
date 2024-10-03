//
//  MyChromaGetNearestNeighborsResponse.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaGetNearestNeighborsResponse: Decodable {
  public let ids: [[String]]
  public let embeddings: [[[Float]]]
  public let documents: [[String]]
  public let metadatas: [[[String: AnyCodable]]]
  public let distances: [[Double]]
}

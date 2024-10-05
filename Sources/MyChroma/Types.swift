//
//  Types.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/5.
//

public enum Include: String, CaseIterable, Codable {
  case metadatas, documents, distances, embeddings, uris, data
}

public struct MyChromaQueryRequest: Decodable {
  public let ids: [[String]]
  public let embeddings: [[[Float]]]?
  public let documents: [[String]]?
  public let metadatas: [[[String: AnyCodable]]]?
  public let distances: [[Double]]?
  public let included: [Include]?
  public let uris: [[String]]?
  // public let data: [[String]]? // TODO Image
}

//
//  Types.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/5.
//

public extension MyChroma {
  enum Include: String, CaseIterable, Codable {
    case metadatas, documents, distances, embeddings, uris, data
  }
  
  struct QueryResult: Codable {
    public let ids: [[String]]
    public let embeddings: [[[Float]]]?
    public let documents: [[String]]?
    public let metadatas: [[[String: AnyCodable]]]?
    public let distances: [[Double]]?
    public let included: [Include]?
    public let uris: [[String]]?
    // public let data: [[String]]? // TODO Image
  }
  
  struct Document {
    public let id: String
    public var metadata: [String: AnyCodable]?
    public var content: String?
    public var embedding: [Float]?
    
    // TODO: media
    
    init(id: String) {
      self.id = id
      self.metadata = nil
      self.content = nil
      self.embedding = nil
    }
  }
}

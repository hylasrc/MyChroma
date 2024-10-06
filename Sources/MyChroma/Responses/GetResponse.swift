//
//  File.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/6.
//

import Foundation

public struct MyChromaGetResponse: Codable {
  public let ids: [String]
  public let embeddings: [Float]?
  public let metadatas: [AnyParams]?
  public let documents: [String]?
  public let uris: [String]?
  // public let data: [String]? // TODO image
  public let included: [MyChroma.Include]?
}

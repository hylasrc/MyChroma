public struct MyChromaCreateCollectionResponse: Decodable {
  public let id: String
  public let name: String
  public let configurationJson: CollectionConfiguration
  public let metadata: [String: AnyCodable]
  public let dimension: Int?
  public let tenant: String
  public let database: String
  public let version: Int
  public let logPosition: Int

  enum CodingKeys: String, CodingKey {
    case id, name, metadata, dimension, tenant, database, version
    case configurationJson = "configuration_json"
    case logPosition = "log_position"
  }
}

public struct CollectionConfiguration: Decodable {
  public let hnswConfiguration: HNSWConfiguration
  public let type: String

  enum CodingKeys: String, CodingKey {
    case hnswConfiguration = "hnsw_configuration"
    case type = "_type"
  }
}

public struct HNSWConfiguration: Decodable {
  public let space: String
  public let efConstruction: Int
  public let efSearch: Int
  public let numThreads: Int
  public let m: Int
  public let resizeFactor: Double
  public let batchSize: Int
  public let syncThreshold: Int
  public let type: String

  enum CodingKeys: String, CodingKey {
    case space, m = "M", resizeFactor = "resize_factor", batchSize = "batch_size", syncThreshold = "sync_threshold"
    case efConstruction = "ef_construction"
    case efSearch = "ef_search"
    case numThreads = "num_threads"
    case type = "_type"
  }
}

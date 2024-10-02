import Foundation

typealias AnyParams = [String: AnyCodable]

protocol RequestPathVariables {
  func populate(_ rawUrl: String) -> String
}

extension RequestPathVariables {
  func populate(_ rawUrl: String) -> String { rawUrl }
}

protocol RequestQueries {
  func populate(_ url: URL) -> URL
}

extension RequestQueries {
  func populate(_ url: URL) -> URL { url }
}

public enum MyChromaCreateDatabaseRequestData {
  public struct Path: RequestPathVariables {}

  public struct Query: RequestQueries {
    var name: String

    func populate(_ url: URL) -> URL {
      url.appending(queryItems: [.init(name: "name", value: name)])
    }
  }

  public struct Body: Codable {
    var tenant: String
  }
}

public enum MyChromaGetDatabaseRequestData {
  public struct Path: RequestPathVariables {
    var database: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{database}", with: database)
    }
  }

  public struct Query: RequestQueries {
    var tenant: String

    func populate(_ url: URL) -> URL {
      url.appending(queryItems: [.init(name: "tenant", value: tenant)])
    }
  }

  public struct Body: Codable {}
}

public enum MyChromaCreateTenantRequestData {
  public struct Path: RequestPathVariables {}

  public struct Query: RequestQueries {}

  public struct Body: Codable {
    var name: String
  }
}

public enum MyChromaGetTenantRequestData {
  public struct Path: RequestPathVariables {
    var tenant: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{tenant}", with: tenant)
    }
  }

  public struct Query: RequestQueries {}

  public struct Body: Codable {}
}

public enum MyChromaListCollectionsRequestData {
  public struct Path: RequestPathVariables {}

  public struct Query: RequestQueries {
    var limit: Int
    var offset: Int
    var tenant: String
    var database: String

    func populate(_ url: URL) -> URL {
      url.appending(queryItems: [
        .init(name: "limit", value: String(limit)),
        .init(name: "offset", value: String(offset)),
        .init(name: "tenant", value: tenant),
        .init(name: "database", value: database),
      ])
    }
  }

  public struct Body: Codable {}
}

public enum MyChromaCreateCollectionRequestData {
  public struct Path: RequestPathVariables {}

  public struct Query: RequestQueries {
    var tenant: String
    var database: String

    func populate(_ url: URL) -> URL {
      url.appending(queryItems: [
        .init(name: "tenant", value: tenant),
        .init(name: "database", value: database),
      ])
    }
  }

  public struct Body: Codable {
    var name: String
    var configuration: AnyParams
    var metadata: AnyParams
    var getOrCreate: Bool
  }
}

public enum MyChromaCountCollectionsRequestData {
  public struct Path: RequestPathVariables {}

  public struct Query: RequestQueries {
    var tenant: String
    var database: String

    func populate(_ url: URL) -> URL {
      url.appending(queryItems: [
        .init(name: "tenant", value: tenant),
        .init(name: "database", value: database),
      ])
    }
  }

  public struct Body: Codable {}
}

public enum MyChromaAddRequestData {
  public struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  public struct Query: RequestQueries {}

  public struct Body: Codable {
    var embeddings: [String]
    var metadatas: [AnyParams?]
    var documents: [String?]
    var uris: [String?]
    var ids: [String]
  }
}

public enum MyChromaUpdateRequestData {
  public struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  public struct Query: RequestQueries {}

  public struct Body: Codable {
    var embeddings: [String]
    var metadatas: [AnyParams?]
    var documents: [String?]
    var uris: [String?]
    var ids: [String]
  }
}

public enum MyChromaUpsertRequestData {
  public struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  public struct Query: RequestQueries {}

  public struct Body: Codable {
    var embeddings: [String]
    var metadatas: [AnyParams?]
    var documents: [String?]
    var uris: [String?]
    var ids: [String]
  }
}

public struct MyChromaGetRequestData {
  var collectionId: String

  public struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  public struct Query: RequestQueries {}

  public struct Body: Codable {
    var ids: [String]
    var `where`: AnyParams
    var whereDocument: AnyParams
    var sort: String
    var limit: Int
    var offset: Int
    var include: [String]
  }
}

public enum MyChromaDeleteRequestData {
  public struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  public struct Query: RequestQueries {}

  public struct Body: Codable {
    var ids: [String]
    var `where`: AnyParams
    var whereDocument: AnyParams
  }
}

public enum MyChromaCountRequestData {
  public struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  public struct Query: RequestQueries {}

  public struct Body: Codable {}
}

public enum MyChromaGetNearestNeighborsRequestData {
  public struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  public struct Query: RequestQueries {}

  public struct Body: Codable {
    var `where`: AnyParams
    var whereDocument: AnyParams
    var queryEmbeddings: [String]
    var nResults: Int
    var include: [String]
  }
}

public enum MyChromaGetCollectionRequestData {
  public struct Path: RequestPathVariables {
    var collectionName: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_name}", with: collectionName)
    }
  }

  public struct Query: RequestQueries {
    var tenant: String
    var database: String

    func populate(_ url: URL) -> URL {
      url.appending(queryItems: [
        .init(name: "tenant", value: tenant),
        .init(name: "database", value: database),
      ])
    }
  }

  public struct Body: Codable {}
}

public enum MyChromaDeleteCollectionRequestData {
  public struct Path: RequestPathVariables {
    var collectionName: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_name}", with: collectionName)
    }
  }

  public struct Query: RequestQueries {
    var tenant: String
    var database: String

    func populate(_ url: URL) -> URL {
      url.appending(queryItems: [
        .init(name: "tenant", value: tenant),
        .init(name: "database", value: database),
      ])
    }
  }

  public struct Body: Codable {}
}

public struct MyChromaUpdateCollectionRequestData {
  var collectionId: String

  public struct Path: RequestPathVariables {
    var collectionId: String

    func populate(_ rawUrl: String) -> String {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  public struct Query: RequestQueries {}

  public struct Body: Codable {
    var newName: String
    var newMetadata: AnyParams
  }
}

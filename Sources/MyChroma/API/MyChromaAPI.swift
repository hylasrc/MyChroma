enum MyChromaAPI {
  static var defaultPath = "http://localhost:8000"
  static var prefix = "/api/v1"

  case root
  case reset
  case version
  case heartbeat
  case preFlightChecks
  case createDatabase(data: MyChromaCreateDatabaseRequestData)
  case getDatabase(data: MyChromaGetDatabaseRequestData)
  case createTenant(data: MyChromaCreateTenantRequestData)
  case getTenant(data: MyChromaGetTenantRequestData)
  case listCollection(data: MyChromaListCollectionsRequestData)
  case createCollections(data: MyChromaCreateCollectionRequestData)
  case countCollections(data: MyChromaCountCollectionsRequestData)
  case add(data: MyChromaAddRequestData)
  case update(data: MyChromaUpdateRequestData)
  case upsert(data: MyChromaUpsertRequestData)
  case get(data: MyChromaGetRequestData)
  case delete(data: MyChromaDeleteRequestData)
  case count(data: MyChromaCountRequestData)
  case getNearestNeighbors(data: MyChromaGetNearestNeighborsRequestData)
  case getCollection(data: MyChromaGetCollectionRequestData)
  case deleteCollection(data: MyChromaDeleteCollectionRequestData)
  case updateCollection(data: MyChromaUpdateCollectionRequestData)

  var uri: String {
    let uri = switch self {
    case .root: ""
    case .reset: "/reset"
    case .version: "/version"
    case .heartbeat: "/heartbeat"
    case .preFlightChecks: "/pre-flight-checks"
    case .createDatabase: "/databases"
    case .getDatabase: "/databases/{database}"
    case .createTenant: "/tenants"
    case .getTenant: "/tenants/{tenant}"
    case .listCollection: "/collections"
    case .createCollections: "/collections"
    case .countCollections: "/count_collections"
    case .add: "/collections/{collection_id}/add"
    case .update: "/collections/{collection_id}/update"
    case .upsert: "/collections/{collection_id}/upsert"
    case .get: "/collections/{collection_id}/get"
    case .delete: "/collections/{collection_id}/delete"
    case .count: "/collections/{collection_id}/count"
    case .getNearestNeighbors: "/collections/{collection_id}/query"
    case .getCollection: "/collections/{collection_name}"
    case .deleteCollection: "/collections/{collection_name}"
    case .updateCollection: "/collections/{collection_id}"
    }
    return "\(MyChromaAPI.prefix)\(uri)"
  }

  var method: String {
    switch self {
    case .root: "GET"
    case .reset: "POST"
    case .version: "GET"
    case .heartbeat: "GET"
    case .preFlightChecks: "GET"
    case .createDatabase: "POST"
    case .getDatabase: "GET"
    case .createTenant: "POST"
    case .getTenant: "GET"
    case .listCollection: "GET"
    case .createCollections: "POST"
    case .countCollections: "GET"
    case .add: "POST"
    case .update: "POST"
    case .upsert: "POST"
    case .get: "POST"
    case .delete: "POST"
    case .count: "GET"
    case .getNearestNeighbors: "POST"
    case .getCollection: "GET"
    case .deleteCollection: "DELETE"
    case .updateCollection: "PUT"
    }
  }

  var headers: [String: String] {
    [
      "Content-Type": "application/json",
      "Accept": "application/json"
    ]
  }
}

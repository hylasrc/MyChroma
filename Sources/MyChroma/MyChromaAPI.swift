import Foundation

enum MyChromaAPI {
  static var defaultURL = URL(string: "http://localhost:8000")!
  static var prefix = "/api/v1"

  case root
  case reset
  case version
  case heartbeat
  case preFlightChecks
  case createDatabase(path: MyChromaCreateDatabaseRequestData.Path, query: MyChromaCreateDatabaseRequestData.Query, body: MyChromaCreateDatabaseRequestData.Body)
  case getDatabase(path: MyChromaGetDatabaseRequestData.Path, query: MyChromaGetDatabaseRequestData.Query, body: MyChromaGetDatabaseRequestData.Body)
  case createTenant(path: MyChromaCreateTenantRequestData.Path, query: MyChromaCreateTenantRequestData.Query, body: MyChromaCreateTenantRequestData.Body)
  case getTenant(path: MyChromaGetTenantRequestData.Path, query: MyChromaGetTenantRequestData.Query, body: MyChromaGetTenantRequestData.Body)
  case listCollection(path: MyChromaListCollectionsRequestData.Path, query: MyChromaListCollectionsRequestData.Query, body: MyChromaListCollectionsRequestData.Body)
  case createCollections(path: MyChromaCreateCollectionRequestData.Path, query: MyChromaCreateCollectionRequestData.Query, body: MyChromaCreateCollectionRequestData.Body)
  case countCollections(path: MyChromaCountCollectionsRequestData.Path, query: MyChromaCountCollectionsRequestData.Query, body: MyChromaCountCollectionsRequestData.Body)
  case add(path: MyChromaAddRequestData.Path, query: MyChromaAddRequestData.Query, body: MyChromaAddRequestData.Body)
  case update(path: MyChromaUpdateRequestData.Path, query: MyChromaUpdateRequestData.Query, body: MyChromaUpdateRequestData.Body)
  case upsert(path: MyChromaUpsertRequestData.Path, query: MyChromaUpsertRequestData.Query, body: MyChromaUpsertRequestData.Body)
  case get(path: MyChromaGetRequestData.Path, query: MyChromaGetRequestData.Query, body: MyChromaGetRequestData.Body)
  case delete(path: MyChromaDeleteRequestData.Path, query: MyChromaDeleteRequestData.Query, body: MyChromaDeleteRequestData.Body)
  case count(path: MyChromaCountRequestData.Path, query: MyChromaCountRequestData.Query, body: MyChromaCountRequestData.Body)
  case getNearestNeighbors(path: MyChromaGetNearestNeighborsRequestData.Path, query: MyChromaGetNearestNeighborsRequestData.Query, body: MyChromaGetNearestNeighborsRequestData.Body)
  case getCollection(path: MyChromaGetCollectionRequestData.Path, query: MyChromaGetCollectionRequestData.Query, body: MyChromaGetCollectionRequestData.Body)
  case deleteCollection(path: MyChromaDeleteCollectionRequestData.Path, query: MyChromaDeleteCollectionRequestData.Query, body: MyChromaDeleteCollectionRequestData.Body)
  case updateCollection(path: MyChromaUpdateCollectionRequestData.Path, query: MyChromaUpdateCollectionRequestData.Query, body: MyChromaUpdateCollectionRequestData.Body)

  var uri: String {
    let uri = switch self {
    case .root: ""
    case .reset: "/reset"
    case .version: "/version"
    case .heartbeat: "heartbeat"
    case .preFlightChecks: "pre-flight-checks"
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
    ["Content-Type": "application/json"]
  }
}

extension MyChromaAPI {
  func asURLRequest() -> URLRequest {
    let urlTemplate = "\(MyChromaAPI.defaultURL)\(uri)"

    let (rawUrl, queries, body): (String, RequestQueries?, Codable?) = switch self {
    case .root:
      (urlTemplate, nil, nil)
    case .reset:
      (urlTemplate, nil, nil)
    case .version:
      (urlTemplate, nil, nil)
    case .heartbeat:
      (urlTemplate, nil, nil)
    case .preFlightChecks:
      (urlTemplate, nil, nil)
    case .createDatabase(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .getDatabase(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .createTenant(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .getTenant(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .listCollection(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .createCollections(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .countCollections(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .add(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .update(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .upsert(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .get(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .delete(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .count(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .getNearestNeighbors(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .getCollection(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .deleteCollection(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    case .updateCollection(path: let path, query: let query, body: let body):
      (path.populate(urlTemplate), query, body)
    }

    var url = URL(string: rawUrl)!
    if let queries { url = queries.populate(url) }

    var request = URLRequest(url: url)
    request.httpMethod = method
    if let body {
      request.httpBody = try? JSONEncoder().encode(body)
    }
    request.allHTTPHeaderFields = headers

    return request
  }
}

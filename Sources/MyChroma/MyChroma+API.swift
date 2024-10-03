public extension MyChroma {
  func root() async throws -> MyChromaRootResponse {
    try await requestAPI(.root)
  }

  func reset() async throws -> Bool {
    try await requestAPI(.reset)
  }

  func version() async throws -> String {
    try await requestAPI(.version)
  }

  func heartbeat() async throws -> MyChromaHeartbeatResponse {
    try await requestAPI(.heartbeat)
  }

  func preFlightChecks() async throws -> MyChromaPreFlightChecksResponse {
    try await requestAPI(.preFlightChecks)
  }

  func createDatabase(_ data: MyChromaCreateDatabaseRequestData) async throws {
    _ = try await requestAPI(.createDatabase(data: data), with: NoDataResponse.self)
  }

  func getDatabase(_ data: MyChromaGetDatabaseRequestData) async throws -> MyChromaGetDatabaseResponse {
    try await requestAPI(.getDatabase(data: data))
  }

  func createTenant(_ data: MyChromaCreateTenantRequestData) async throws {
    _ = try await requestAPI(.createTenant(data: data), with: NoDataResponse.self)
  }

  func getTenant(_ data: MyChromaGetTenantRequestData) async throws -> MyChromaGetTenantResponse {
    try await requestAPI(.getTenant(data: data))
  }

  func createCollection(_ data: MyChromaCreateCollectionRequestData) async throws -> MyChromaCreateCollectionResponse {
    try await requestAPI(.createCollections(data: data))
  }

  func listCollections(_ data: MyChromaListCollectionsRequestData) async throws -> MyChromaListCollectionsResponse {
    try await requestAPI(.listCollection(data: data))
  }

  func countCollections(_ data: MyChromaCountCollectionsRequestData) async throws -> Int {
    try await requestAPI(.countCollections(data: data))
  }

  func add(_ data: MyChromaAddRequestData) async throws {
    _ = try await requestAPI(.add(data: data), with: NoDataResponse.self)
  }

  // func update(_ data: MyChromaUpdateRequestData) async throws -> MyChromaUpdateResponse {
  //   try await requestAPI(.update(data: data))
  // }

  // func upsert(_ data: MyChromaUpsertRequestData) async throws -> MyChromaUpsertResponse {
  //   try await requestAPI(.upsert(data: data))
  // }

  // func get(_ data: MyChromaGetRequestData) async throws -> MyChromaGetResponse {
  //   try await requestAPI(.get(data: data))
  // }

  func delete(_ data: MyChromaDeleteRequestData) async throws -> MyChromaDeleteResponse {
    try await requestAPI(.delete(data: data))
  }

  func count(_ data: MyChromaCountRequestData) async throws -> MyChromaCountResponse {
    try await requestAPI(.count(data: data))
  }

  func getNearestNeighbors(_ data: MyChromaGetNearestNeighborsRequestData) async throws -> MyChromaGetNearestNeighborsResponse {
    try await requestAPI(.getNearestNeighbors(data: data))
  }

  func getCollection(_ data: MyChromaGetCollectionRequestData) async throws -> MyChromaGetCollectionResponse {
    try await requestAPI(.getCollection(data: data))
  }

  func deleteCollection(_ data: MyChromaDeleteCollectionRequestData) async throws {
    _ = try await requestAPI(.deleteCollection(data: data), with: NoDataResponse.self)
  }

  func updateCollection(_ data: MyChromaUpdateCollectionRequestData) async throws {
    _ = try await requestAPI(.updateCollection(data: data), with: NoDataResponse.self)
  }
}

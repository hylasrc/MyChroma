//
//  MyChroma++.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/6.
//

public extension MyChroma {
  func similaritySearch(_ data: MyChromaGetNearestNeighborsRequestData) async throws -> [MyChroma.Document] {
    try await requestAPI(.getNearestNeighbors(data: data), with: MyChroma.QueryResult.self).toDocuments()
  }
}

extension MyChroma.QueryResult {
  func toDocuments() -> [MyChroma.Document] {
    guard let ids = ids.first else { return [] }
    let contents = documents?.first
    let metadatas = metadatas?.first
    let embeddings = embeddings?.first
    // let uris = uris?.first ?? []

    var documents = [] as [MyChroma.Document]
    for i in 0 ..< ids.count {
      var doc = MyChroma.Document(id: ids[i])
      doc.content = contents?[i]
      doc.metadata = metadatas?[i]
      doc.embedding = embeddings?[i]
      // doc.uris = uris?[i]
      documents.append(doc)
    }
    return documents
  }
}

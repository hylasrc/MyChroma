//
//  MyChromaGetNearestNeighborsRequestData.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

public struct MyChromaGetNearestNeighborsRequestData
{
  internal var path: Self.Path
  internal var queries: Self.Query
  internal var body: Self.Body

  public init(
    collectionId: String, queryEmbeddings: [[Float]], nResults: Int?,
    where: [String: Encodable]?, whereDocument: [String: Encodable]?, include: [MyChroma.Include])
  {
    path = .init(collectionId: collectionId)
    queries = .init()
    body = .init(queryEmbeddings: queryEmbeddings, where: AnyEncodable(`where`), whereDocument: AnyEncodable(whereDocument),
                 nResults: nResults, include: include)
  }

  public init(
    collectionId: String, queryEmbeddings: [[Double]], nResults: Int?,
    where: [String: Encodable]?, whereDocument: [String: Encodable]?, include: [MyChroma.Include])
  {
    self.init(collectionId: collectionId, queryEmbeddings: queryEmbeddings.asFloatArray(),
              nResults: nResults, where: `where`, whereDocument: whereDocument, include: include)
  }

  public init(
    collectionId: String, queryEmbeddings: [[Float]], nResults: Int? = nil,
    where: Where? = nil, whereDocument: WhereDocument? = nil, include: [MyChroma.Include] = [.metadatas, .documents, .distances])
  {
    self.init(collectionId: collectionId, queryEmbeddings: queryEmbeddings, nResults: nResults,
              where: `where`?.build(), whereDocument: whereDocument?.build(), include: include)
  }

  public init(
    collectionId: String, queryEmbeddings: [[Double]], nResults: Int? = nil,
    where: Where? = nil, whereDocument: WhereDocument? = nil,
    include: [MyChroma.Include] = [.metadatas, .documents, .distances])
  {
    self.init(collectionId: collectionId, queryEmbeddings: queryEmbeddings, nResults: nResults,
              where: `where`?.build(), whereDocument: whereDocument?.build(), include: include)
  }

  public init(
    collectionId: String, queryEmbeddings: [Float], nResults: Int? = nil,
    where: Where? = nil, whereDocument: WhereDocument? = nil, include: [MyChroma.Include] = [.metadatas, .documents, .distances])
  {
    self.init(collectionId: collectionId, queryEmbeddings: [queryEmbeddings], nResults: nResults,
              where: `where`?.build(), whereDocument: whereDocument?.build(), include: include)
  }

  public init(
    collectionId: String, queryEmbeddings: [Double], nResults: Int? = nil,
    where: Where? = nil, whereDocument: WhereDocument? = nil, include: [MyChroma.Include] = [.metadatas, .documents, .distances])
  {
    self.init(collectionId: collectionId, queryEmbeddings: [queryEmbeddings], nResults: nResults,
              where: `where`?.build(), whereDocument: whereDocument?.build(), include: include)
  }

  internal struct Path: RequestPathVariables
  {
    var collectionId: String

    func populate(_ rawUrl: String) -> String
    {
      rawUrl.replacingOccurrences(of: "{collection_id}", with: collectionId)
    }
  }

  internal struct Query: RequestQueries {}

  internal struct Body: Encodable
  {
    var queryEmbeddings: [[Float]]
    var `where`: AnyEncodable?
    var whereDocument: AnyEncodable?
    var nResults: Int?
    var include: [MyChroma.Include]

    enum CodingKeys: String, CodingKey
    {
      case `where`
      case whereDocument = "where_document"
      case queryEmbeddings = "query_embeddings"
      case nResults = "n_results"
      case include
    }
  }
}

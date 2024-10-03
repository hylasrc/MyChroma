//
//  MyChromaAPI+URLRequest.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/3.
//

import Foundation

extension MyChromaAPI {
  func asURLRequest(_ path: String = MyChromaAPI.defaultPath) -> URLRequest {
    let urlTemplate = "\(path)\(uri)"

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
    case let .createDatabase(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .getDatabase(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .createTenant(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .getTenant(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .listCollection(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .createCollections(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .countCollections(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .add(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .update(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .upsert(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .get(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .delete(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .count(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .getNearestNeighbors(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .getCollection(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .deleteCollection(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    case let .updateCollection(data: data):
      (data.path.populate(urlTemplate), data.queries, data.body)
    }

    var url = URL(string: rawUrl)!
    if let queries { url = queries.populate(url) }

    var request = URLRequest(url: url)
    request.httpMethod = method
    if method != "GET", let body {
      request.httpBody = try? JSONEncoder().encode(body)
    }
    request.allHTTPHeaderFields = headers
    return request
  }
}

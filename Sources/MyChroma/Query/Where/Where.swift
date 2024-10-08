//
//  Where.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/8.
//

public struct Where: QueryNode {
  let elements: [QueryNode]

  public init(@QueryBuilder _ builder: () -> [QueryNode]) {
    elements = builder()
  }

  public func build() -> [String: Encodable] {
    elements.reduce(into: [String: Encodable]()) { result, element in
      result.merge(element.build()) { current, _ in current }
    }
  }
}

public typealias WhereDocument = Where

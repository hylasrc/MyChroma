//
//  QueryBuilder.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/7.
//

@resultBuilder
public struct QueryBuilder {
  public static func buildBlock(_ components: QueryNode...) -> [QueryNode] {
    components
  }
}

public protocol QueryNode {
  func build() -> [String: Encodable]
}

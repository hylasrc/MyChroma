//
//  And.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/8.
//

public struct And: CompoundQueryNode {
  var op: Operator = .and
  var elements: [QueryNode]

  public init(@QueryBuilder _ builder: () -> [QueryNode]) {
    elements = builder()
  }
}

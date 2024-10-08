//
//  Or.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/8.
//

public struct Or: CompoundQueryNode {
  let op: Operator = .or
  let elements: [QueryNode]

  public init(@QueryBuilder _ builder: () -> [QueryNode]) {
    elements = builder()
  }
}

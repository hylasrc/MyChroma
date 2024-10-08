//
//  CompoundQueryNode.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/7.
//

protocol CompoundQueryNode: QueryNode {
  var op: Operator { get }
  var elements: [QueryNode] { get }
}

extension CompoundQueryNode {
  public func build() -> [String: Encodable] {
    [op.rawValue: AnyEncodable(elements.map { $0.build() })]
  }
}

//
//  KVNode.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/8.
//

public class KVNode: QueryNode {
  let k: String
  let v: Encodable

  init(k: String, v: Encodable) {
    self.k = k
    self.v = v
  }

  public func build() -> [String: Encodable] {
    [k: v]
  }
}

public func contains(_ content: String) -> KVNode {
  KVNode(k: Operator.contains.rawValue, v: content)
}

func notContains(_ content: String) -> KVNode {
  KVNode(k: Operator.notContains.rawValue, v: content)
}

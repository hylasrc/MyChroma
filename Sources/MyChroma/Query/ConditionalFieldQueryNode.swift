//
//  FieldCondition.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/7.
//

public class ConditionalFieldQueryNode: QueryNode {
  let key: String
  var conditions: [String: Encodable] = [:]

  public init(key: String) {
    self.key = key
  }

  public func build() -> [String: Encodable] {
    [key: AnyEncodable(conditions)]
  }

  func addCondition(_ op: Operator, _ value: Encodable) -> Self {
    conditions[op.rawValue] = value
    return self
  }

  func addCondition(_ op: Operator, _ value: [Encodable]) -> Self {
    conditions[op.rawValue] = AnyEncodable(value)
    return self
  }
}

public extension ConditionalFieldQueryNode {
  func eq(_ value: Encodable) -> ConditionalFieldQueryNode { addCondition(Operator.eq, value) }
  func gt(_ value: Encodable) -> ConditionalFieldQueryNode { addCondition(.gt, value) }
  func gte(_ value: Encodable) -> ConditionalFieldQueryNode { addCondition(.gte, value) }
  func lt(_ value: Encodable) -> ConditionalFieldQueryNode { addCondition(.lt, value) }
  func lte(_ value: Encodable) -> ConditionalFieldQueryNode { addCondition(.lte, value) }
  func ne(_ value: Encodable) -> ConditionalFieldQueryNode { addCondition(.ne, value) }
  func `in`(_ values: [Encodable]) -> ConditionalFieldQueryNode { addCondition(.in, values) }
  func nin(_ values: [Encodable]) -> ConditionalFieldQueryNode { addCondition(.nin, values) }
}

public extension String {
  func eq(_ value: Encodable) -> ConditionalFieldQueryNode { return ConditionalFieldQueryNode(key: self).addCondition(.eq, value) }
  func gt(_ value: Encodable) -> ConditionalFieldQueryNode { return ConditionalFieldQueryNode(key: self).addCondition(.gt, value) }
  func gte(_ value: Encodable) -> ConditionalFieldQueryNode { return ConditionalFieldQueryNode(key: self).addCondition(.gte, value) }
  func lt(_ value: Encodable) -> ConditionalFieldQueryNode { return ConditionalFieldQueryNode(key: self).addCondition(.lt, value) }
  func lte(_ value: Encodable) -> ConditionalFieldQueryNode { return ConditionalFieldQueryNode(key: self).addCondition(.lte, value) }
  func ne(_ value: Encodable) -> ConditionalFieldQueryNode { return ConditionalFieldQueryNode(key: self).addCondition(.ne, value) }
  // func `in`(_ values: [Encodable]) -> ConditionalFieldQueryNode { return ConditionalFieldQueryNode(key: self).addCondition(.in, values) }
  func `in`(_ values: Encodable...) -> ConditionalFieldQueryNode { return ConditionalFieldQueryNode(key: self).addCondition(.in, values) }
  func nin(_ values: Encodable...) -> ConditionalFieldQueryNode { return ConditionalFieldQueryNode(key: self).addCondition(.nin, values) }
}

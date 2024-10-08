//
//  Operator.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/7.
//

public enum Operator: String {
  case and = "$and"
  case or = "$or"
  case gt = "$gt"
  case gte = "$gte"
  case lt = "$lt"
  case lte = "$lte"
  case ne = "$ne"
  case eq = "$eq"
  case `in` = "$in"
  case nin = "$nin"
  case contains = "$contains"
  case notContains = "$not_contains"
}

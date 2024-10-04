//
//  [Double]++.swift
//  MyChroma
//
//  Created by Howie Young on 2024/10/4.
//

extension [Double] {
  func asFloatArray() -> [Float] {
    map { Float($0) }
  }
}

extension [[Double]] {
  func asFloatArray() -> [[Float]] {
    map { $0.asFloatArray() }
  }
}

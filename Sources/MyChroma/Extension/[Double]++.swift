//
//  [Double]++.swift
//  MyChroma
//
//  Created by Hylas on 2024/10/4.
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

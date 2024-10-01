// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MyChroma",
  platforms: [
    .macOS(.v12),
    .macCatalyst(.v15),
  ],
  products: [
    .library(
      name: "MyChroma",
      targets: ["MyChroma"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(name: "MyChroma", dependencies: []),
    .testTarget(
      name: "MyChromaTests",
      dependencies: ["MyChroma"]
    ),
  ]
)

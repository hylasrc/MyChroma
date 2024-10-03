// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MyChroma",
  platforms: [
    .iOS(.v12),
    .macOS(.v13),
    .macCatalyst(.v13),
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

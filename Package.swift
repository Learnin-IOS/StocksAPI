// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StocksAPI",
    platforms: [
        .iOS(.v13), .macOS(.v12), .macCatalyst(.v13), .tvOS(.v13), .watchOS(.v8)
    ],
    products: [
        .library(
            name: "StocksAPI",
            targets: ["StocksAPI"]),
        .executable(
            name: "StocksAPIExec",
            targets: ["StocksAPIExec"])
    ],
    targets: [
        .target(
            name: "StocksAPI",
            dependencies: []),
        .executableTarget(
            name: "StocksAPIExec",
            dependencies: ["StocksAPI"]),
        .testTarget(
            name: "StocksAPITests",
            dependencies: ["StocksAPI"]),
    ]
)

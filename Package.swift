// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LifoCollections",
    platforms: [
            .macOS(.v10_13), .iOS(.v12)
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LifoCollections",
            type: .dynamic,
            targets: ["LifoCollections"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LifoCollections"),
        .testTarget(
            name: "LifoCollectionsTests",
            dependencies: ["LifoCollections"]),
    ]
)

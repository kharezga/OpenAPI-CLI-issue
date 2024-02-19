// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyCoolPackage",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "MyCoolPackage",
            targets: ["MyCoolPackage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator", .upToNextMinor(from: "1.2.1")),
        .package(url: "https://github.com/apple/swift-openapi-runtime", .upToNextMinor(from: "1.3.2")),
        .package(url: "https://github.com/RocketLaunchpad/Keychain", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "MyCoolPackage",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "Keychain", package: "Keychain")
            ],
            path: "./Sources",
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator")
            ]),
        .testTarget(
            name: "MyCoolPackageTests",
            dependencies: ["MyCoolPackage"]),
    ]
)

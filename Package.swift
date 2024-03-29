// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Secrets",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .watchOS(.v9)
    ],
    products: [
        .library(
            name: "Secrets",
            targets: ["Secrets"]),
    ],
    dependencies: [
        .package(url: "https://github.com/archivable/package.git", branch: "main")
    ],
    targets: [
        .target(
            name: "Secrets",
            dependencies: [
                .product(name: "Archivable", package: "package")],
            path: "Sources"),
        .testTarget(
            name: "Tests",
            dependencies: ["Secrets"],
            path: "Tests"),
    ]
)

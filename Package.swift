// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftCloudSample",
    platforms: [.macOS(.v10_15)],
    dependencies: [
        .package(
            url: "https://github.com/swift-cloud/Compute",
            from: "1.0.0"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "SwiftCloudSample",
            dependencies: ["Compute"]),
        .testTarget(
            name: "SwiftCloudSampleTests",
            dependencies: ["SwiftCloudSample"]),
    ]
)

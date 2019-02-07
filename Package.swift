// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iLogYou",
    dependencies: [
        .package(
            url: "https://github.com/yonaskolb/XcodeGen.git",
            from: "1.0.0"
        )
        ],
    targets: [
        .target(
            name: "iLogYou",
            dependencies: ["iLogYouCore"]),
        .target(
            name: "iLogYouCore",
            dependencies: ["XcodeGenKit"]),
        .testTarget(
            name: "iLogYouTests",
            dependencies: ["iLogYouCore", "XcodeGenKit"]),
    ]
)

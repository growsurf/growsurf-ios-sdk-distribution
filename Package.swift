// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "GrowSurfSDK",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "GrowSurfSDK", targets: ["GrowSurfSDK"]),
        .library(name: "GrowSurfBranchAttribution", targets: ["GrowSurfSDK", "GrowSurfBranchAttribution"]),
        .library(name: "GrowSurfAdjustAttribution", targets: ["GrowSurfSDK", "GrowSurfAdjustAttribution"]),
        .library(name: "GrowSurfAppsFlyerAttribution", targets: ["GrowSurfSDK", "GrowSurfAppsFlyerAttribution"]),
        .library(name: "GrowSurfSingularAttribution", targets: ["GrowSurfSDK", "GrowSurfSingularAttribution"]),
    ],
    targets: [
        .binaryTarget(
            name: "GrowSurfSDK",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfSDK.xcframework.zip",
            checksum: "af295a432c2385c7afc491f48c0b2401fadc1f0b21cab2bde494ac420d05e26b"
        ),
        .binaryTarget(
            name: "GrowSurfBranchAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "c7923005f9718e2df6d31ee7df2b5d13263a60f9d5e37fa78b3390fa6b37fb5f"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "c69b0b618d0fcad49fd4fd3d18346b370d4967bd2c7f399cb47ffe09e6d15f44"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "6ef8f5ad4d3e112e9f4456d6d8c5b330f93db8ac177a620736b785e14433b79d"
        ),
        .binaryTarget(
            name: "GrowSurfSingularAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfSingularAttribution.xcframework.zip",
            checksum: "ff4bc8100c8a6fdcd6cb6db99a9f3a4a9f83beb373eb2c9e5a5b1d1192ac1eed"
        ),
    ]
)

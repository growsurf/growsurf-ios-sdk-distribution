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
            checksum: "138da865e9c439d44a2e7de96a9b0e3f85f58f29651fa8432335767ef668ecc6"
        ),
        .binaryTarget(
            name: "GrowSurfBranchAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "726a467566e29d572f392c89dfd4be64bd35bfec3be9cd31cd31cd73299d78c1"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "fa7cb69c90edfafcafc4514d6fd386e58e182ea4a5e878d59fb1293bb82f7055"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "c883a85c1578247702b57cde877346236aaed1aeff8fb34a0079f0d8faf635be"
        ),
        .binaryTarget(
            name: "GrowSurfSingularAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfSingularAttribution.xcframework.zip",
            checksum: "b4f7611d382ac1c5f510938737a3399f12e0a40c3cd1ede45b5cd23f2102bb81"
        ),
    ]
)

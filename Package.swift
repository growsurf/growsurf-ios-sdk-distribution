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
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.1/GrowSurfSDK.xcframework.zip",
            checksum: "ca94c6d9cc7f07af3c53b5185c5500661700e7cff53afe0f929e19a2df9e0288"
        ),
        .binaryTarget(
            name: "GrowSurfBranchAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.1/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "4946b196bf93e8e5f713debffb82b1c532ae298e980f6b12cface9dd0f607dea"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.1/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "bb4f65c037b4fa6565fe35e495d1ef2a77747d9ca71e0416a229577179ebf52d"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.1/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "269cebb8e205a8b636eac9bb2342d76c16c1f42e2a09f29b5526fb00589976a4"
        ),
        .binaryTarget(
            name: "GrowSurfSingularAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.1/GrowSurfSingularAttribution.xcframework.zip",
            checksum: "0cfeb3536db640ccf10ba3356564a0c548ceb91ea0c82a2ccd7050657de52184"
        ),
    ]
)

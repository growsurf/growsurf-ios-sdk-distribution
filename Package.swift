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
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.3.0/GrowSurfSDK.xcframework.zip",
            checksum: "6c43e3be6cee8689513ba91dab241534d36a6f91329f86bc75bb24dbcaa56113"
        ),
        .binaryTarget(
            name: "GrowSurfBranchAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.3.0/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "6d563af742f5ab772ea4f1a748463d7ad4ba9f425b5b20fb23fd61923a6c8b94"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.3.0/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "62456a89008a9c8253bfcb85c8af98252d8def25e452bd7b8f58e55c34dde782"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.3.0/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "d27ca5acddcda3e855ec775fa37a020bae60e440005d0e59ca34fd422129c6eb"
        ),
        .binaryTarget(
            name: "GrowSurfSingularAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.3.0/GrowSurfSingularAttribution.xcframework.zip",
            checksum: "7313938413514be3a7db7d14bc5dc1efbdeefde56767a56d77a7358eced4dd6a"
        ),
    ]
)

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
    ],
    targets: [
        .binaryTarget(
            name: "GrowSurfSDK",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.1.0/GrowSurfSDK.xcframework.zip",
            checksum: "7798e75d583fef810844a357906c9dcc030bbd0e128b3a392fad910d1babf40c"
        ),
        .binaryTarget(
            name: "GrowSurfBranchAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.1.0/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "c0cbe168f96fd59220d720d5587fd70af0c19937fd00bb6ed5ad4b4c749599a3"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.1.0/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "671ffb6657968850b1f701d48ce821798179f59779fc78b9342eae75eaefaf02"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.1.0/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "c17ca272fbbc861bf5221cfdd04cb7927067f5c00613684d52a8e5e4d81452c3"
        ),
    ]
)

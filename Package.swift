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
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.1.1/GrowSurfSDK.xcframework.zip",
            checksum: "76b18c5b48bfae8244a8e18d88d047a1f4142a559a855e6e63e3beae7c2b5d8a"
        ),
        .binaryTarget(
            name: "GrowSurfBranchAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.1.1/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "69e75c49347609c6f010d95fbf2ad418d0ec86344859b88e1cc441669b432277"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.1.1/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "2077b72dd3eb0d19c2f8842c72ba03dde2bf9c0647f8124f7f41ac23de7c99a4"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.1.1/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "52bb8c243e5833d19137afbb80cafa46a00abfac33b370775055b3d333ea11fc"
        ),
    ]
)

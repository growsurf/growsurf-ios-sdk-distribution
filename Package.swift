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
            checksum: "629ce7b2e51663b813022c1f3fe1ad11c8ed718a00de68b965d1a602ae17e27b"
        ),
        .binaryTarget(
            name: "GrowSurfBranchAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "42dce3d737cae735ab6c32e6f44d5bda749f13fa76c3e3f84f28d9efd5d800e9"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "e803edb992b44bccc1fcb010a5b5d28c0f3516f6637fe35d2fb13cf4723e455a"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "597b24f808234a77910ec45bb3904afc97a3a0b111d360681c96a9d5c25ca68c"
        ),
        .binaryTarget(
            name: "GrowSurfSingularAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.2.0/GrowSurfSingularAttribution.xcframework.zip",
            checksum: "a460f9cc594960990884c0ce618a13df2e8fd8031502db0fe960772440d55c6e"
        ),
    ]
)

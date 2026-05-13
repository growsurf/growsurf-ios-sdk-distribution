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
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.1.2/GrowSurfSDK.xcframework.zip",
            checksum: "87207e13de9220bfc512b61416682162304fc672c480f273da0b36057c122638"
        ),
        .binaryTarget(
            name: "GrowSurfBranchAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.1.2/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "36126690d021c5505baaff162a8d37ed54ad78d31d9905a4664473cc3e35e584"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.1.2/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "91f3bf7283338f65c100f395a2feb822d16e93d960ee798dfea20b0fd0c47b71"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.1.2/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "2ea0c326deed83ed611e73643f94a5d61428753fedecb49688cf6a1010661630"
        ),
    ]
)

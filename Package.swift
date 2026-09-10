// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "GrowSurfSDK",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "GrowSurfSDK", targets: ["GrowSurfSDK"]),
        .library(name: "GrowSurfGoogleContacts", targets: ["GrowSurfGoogleContacts"]),
        .library(name: "GrowSurfBranchAttribution", targets: ["GrowSurfSDK", "GrowSurfBranchAttribution"]),
        .library(name: "GrowSurfAdjustAttribution", targets: ["GrowSurfSDK", "GrowSurfAdjustAttribution"]),
        .library(name: "GrowSurfAppsFlyerAttribution", targets: ["GrowSurfSDK", "GrowSurfAppsFlyerAttribution"]),
        .library(name: "GrowSurfSingularAttribution", targets: ["GrowSurfSDK", "GrowSurfSingularAttribution"]),
    ],
    dependencies: [
        .package(url: "https://github.com/google/GoogleSignIn-iOS", from: "9.1.0"),
    ],
    targets: [
        .binaryTarget(
            name: "GrowSurfSDK",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.4.0/GrowSurfSDK.xcframework.zip",
            checksum: "411e8d401c3dbec586538c21f5d6c0962ca7e2358841dd514ac4250a66a67946"
        ),
        // Optional GoogleSignIn-backed contacts import, layered on the binary Core. Distributed as
        // source because a binaryTarget cannot declare the external GoogleSignIn dependency. Consumers
        // who don't add this product never link GoogleSignIn.
        .target(
            name: "GrowSurfGoogleContacts",
            dependencies: [
                "GrowSurfSDK",
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
            ],
            path: "Sources/GrowSurfGoogleContacts"
        ),
        .binaryTarget(
            name: "GrowSurfBranchAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.4.0/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "38bb311b49344c4c5d9f5ae8d5a65296ff4774f41eff9e69ec76b09f97eb1fc1"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.4.0/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "68fa2085c5a9e7c3f7dd9aa37a5a12792994a7f14c6619290af45b7a913f2fee"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.4.0/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "15a960c0e900f49a0dd367b14337d380e8a065765dc37d4c71c116a449421514"
        ),
        .binaryTarget(
            name: "GrowSurfSingularAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.4.0/GrowSurfSingularAttribution.xcframework.zip",
            checksum: "b6df13a948856838ae44e8c4ce1815d1a7a9f99ae2731767feadd58cce97048a"
        ),
    ]
)

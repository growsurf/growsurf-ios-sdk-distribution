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
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.3/GrowSurfSDK.xcframework.zip",
            checksum: "2747fd3b8ca9d70a2388044376f1c0f2cd69544c11c60d5afdbe54b455a91ba9"
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
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.3/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "02ddee77da657d69166ff9df6927ff6e4c413ad7d979d267098bf9d7f13c6bca"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.3/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "1b8000aeeccc804863e3dfdca2e048097c7abafb1404ee6e620f5ac453ff937f"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.3/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "55c6d1a4da1e93219d21f648231a03bd943b8d61a22470de4a6fa105b1050ac0"
        ),
        .binaryTarget(
            name: "GrowSurfSingularAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.3/GrowSurfSingularAttribution.xcframework.zip",
            checksum: "9488a477fbdbf38d645f1b9178b003b14623ae7b2e17d6b536eb003b6f8f3077"
        ),
    ]
)

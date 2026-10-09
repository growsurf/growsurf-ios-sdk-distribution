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
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.8.0/GrowSurfSDK.xcframework.zip",
            checksum: "87b1b706943e89babb3c71937d90027bceb212768d7a2d5df901ad76e724b9ae"
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
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.8.0/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "bf782ddf42da264fbfb74fcf74f1b1095e9426c667d41b6f6c1dc59d8db1cff4"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.8.0/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "0cad3844f05d918f34f4da3943adca90c0f85a958c59501d0fd27285333c7537"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.8.0/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "3ffb67e092fe5f4113a3e3553c529a28e118b5dd9ca25617cfdd583449f02aad"
        ),
        .binaryTarget(
            name: "GrowSurfSingularAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.8.0/GrowSurfSingularAttribution.xcframework.zip",
            checksum: "e2e49e6af5372ee4f88a782759c8a9916535baa2b0b20f87daa0c6609fa76ba0"
        ),
    ]
)

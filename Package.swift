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
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.5/GrowSurfSDK.xcframework.zip",
            checksum: "cb483a1baccfda372ebe21b409e1674ac0bfd6b5fcf34cf984bb520515273e0d"
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
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.5/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "9a3f8e3a43179f8d432ca69a24bf42e059e81c2ce1d34d4ce7df3042ef48b399"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.5/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "e75aed2371a46b2c830a3e917a362cc3d594d3f2e72bb87a2fa180ee90fe6402"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.5/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "8d6db30ec30503ed0e0123d52e22d0ba4de0c599aeefdfa1a5ffdc727b9e8cce"
        ),
        .binaryTarget(
            name: "GrowSurfSingularAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.5/GrowSurfSingularAttribution.xcframework.zip",
            checksum: "d18b4ee9c99178a3ef8b0fb600de156646a1a076186945e6cb7267f10438a9d4"
        ),
    ]
)

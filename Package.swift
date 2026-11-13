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
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.4/GrowSurfSDK.xcframework.zip",
            checksum: "1e065354e97f6bba1cbe3e4e6b3e8d909f5e8bd856ce1811385689b682e5d5ed"
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
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.4/GrowSurfBranchAttribution.xcframework.zip",
            checksum: "cb988e4202121e90b7ba1353c43e64ff2d6ed68a7ecc30f105aaac64114fcf79"
        ),
        .binaryTarget(
            name: "GrowSurfAdjustAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.4/GrowSurfAdjustAttribution.xcframework.zip",
            checksum: "401d0816736b9decf2cb2244e16ff2543e99357af6cc3e798863b3cd4b89e254"
        ),
        .binaryTarget(
            name: "GrowSurfAppsFlyerAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.4/GrowSurfAppsFlyerAttribution.xcframework.zip",
            checksum: "0ad92ab0dd648e4b44c740828789a306f11537793025f91293abbd6d31855e38"
        ),
        .binaryTarget(
            name: "GrowSurfSingularAttribution",
            url: "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.10.4/GrowSurfSingularAttribution.xcframework.zip",
            checksum: "ade4a4c482fb7ecef9dbbae9474c077348e765658108a3360aa59517a8a7e5f0"
        ),
    ]
)

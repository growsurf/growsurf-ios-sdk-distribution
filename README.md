# GrowSurf iOS SDK Distribution

Public binary distribution for the GrowSurf iOS SDK. The SDK implementation source is private; this repository contains only Swift Package Manager metadata, CocoaPods metadata, license text, release notes, and public binary release artifacts.

## Installation

Choose one install path.

### CocoaPods

```ruby
pod 'GrowSurfSDK', '~> 0.1.1'
```

Optional attribution adapters are available as subspecs:

```ruby
pod 'GrowSurfSDK/BranchAttribution', '~> 0.1.1'
pod 'GrowSurfSDK/AdjustAttribution', '~> 0.1.1'
pod 'GrowSurfSDK/AppsFlyerAttribution', '~> 0.1.1'
```

### Swift Package Manager

Add this repository URL in Xcode:

```text
https://github.com/growsurf/growsurf-ios-sdk-distribution.git
```

Use version `0.1.1` or later and add the `GrowSurfSDK` product to your app target.

Package manifest example:

```swift
dependencies: [
    .package(url: "https://github.com/growsurf/growsurf-ios-sdk-distribution.git", from: "0.1.1"),
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "GrowSurfSDK", package: "growsurf-ios-sdk-distribution"),
        ]
    ),
]
```

Optional attribution products:

```swift
.product(name: "GrowSurfBranchAttribution", package: "growsurf-ios-sdk-distribution")
.product(name: "GrowSurfAdjustAttribution", package: "growsurf-ios-sdk-distribution")
.product(name: "GrowSurfAppsFlyerAttribution", package: "growsurf-ios-sdk-distribution")
```

### Manual

Download the required XCFramework zips from the [`v0.1.1` release](https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/tag/v0.1.1), unzip them, drag the frameworks into your Xcode project, and set each framework to **Embed & Sign**.

## Release Artifacts

The `v0.1.1` release contains:

- `GrowSurfSDK.xcframework.zip`
- `GrowSurfBranchAttribution.xcframework.zip`
- `GrowSurfAdjustAttribution.xcframework.zip`
- `GrowSurfAppsFlyerAttribution.xcframework.zip`
- `GrowSurfSDK-CocoaPods-0.1.1.zip`

## Documentation

See the public iOS SDK docs:

```text
https://docs.growsurf.com/developer-tools/ios-sdk
```

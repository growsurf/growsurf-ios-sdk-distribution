# GrowSurf iOS SDK Distribution

Public binary distribution for the GrowSurf iOS SDK. The SDK implementation source is private; this repository contains only Swift Package Manager metadata, CocoaPods metadata, license text, release notes, and public binary release artifacts.

## Installation

Choose one install path.

### CocoaPods

Use the tag-pinned public podspec:

```ruby
growsurf_podspec = 'https://raw.githubusercontent.com/growsurf/growsurf-ios-sdk-distribution/v0.3.0/GrowSurfSDK.podspec'

pod 'GrowSurfSDK', :podspec => growsurf_podspec
```

Optional attribution adapters are available as subspecs:

```ruby
pod 'GrowSurfSDK/BranchAttribution', :podspec => growsurf_podspec
pod 'GrowSurfSDK/AdjustAttribution', :podspec => growsurf_podspec
pod 'GrowSurfSDK/AppsFlyerAttribution', :podspec => growsurf_podspec
pod 'GrowSurfSDK/SingularAttribution', :podspec => growsurf_podspec
```

### Swift Package Manager

Add this repository URL in Xcode:

```text
https://github.com/growsurf/growsurf-ios-sdk-distribution.git
```

Use version `0.3.0` or later and add the `GrowSurfSDK` product to your app target.

Package manifest example:

```swift
dependencies: [
    .package(url: "https://github.com/growsurf/growsurf-ios-sdk-distribution.git", from: "0.3.0"),
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
.product(name: "GrowSurfSingularAttribution", package: "growsurf-ios-sdk-distribution")
```

### Manual

Download the required XCFramework zips from the [`v0.3.0` release](https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/tag/v0.3.0), unzip them, drag the frameworks into your Xcode project, and set each framework to **Embed & Sign**.

## Release Artifacts

The `v0.3.0` release contains:

- `GrowSurfSDK.xcframework.zip`
- `GrowSurfBranchAttribution.xcframework.zip`
- `GrowSurfAdjustAttribution.xcframework.zip`
- `GrowSurfAppsFlyerAttribution.xcframework.zip`
- `GrowSurfSingularAttribution.xcframework.zip`
- `GrowSurfSDK-CocoaPods-0.3.0.zip`

## Documentation

See the public iOS SDK docs:

```text
https://docs.growsurf.com/developer-tools/ios-sdk
```

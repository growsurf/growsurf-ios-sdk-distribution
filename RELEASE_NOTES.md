# Release Notes

## 0.1.2

Refreshes the binary release artifacts for the public distribution repo.

- Updates Swift Package Manager checksums.
- Updates the CocoaPods binary source archive.
- Keeps the package products unchanged: `GrowSurfSDK`, `GrowSurfBranchAttribution`, `GrowSurfAdjustAttribution`, and `GrowSurfAppsFlyerAttribution`.

## 0.1.1

Fixes binary Swift Package Manager and manual XCFramework consumers by exposing the public client as `GrowSurf` from the `GrowSurfSDK` module.

- Updates all public binary artifacts and checksums.
- Updates the CocoaPods binary source archive.
- Keeps the package products unchanged: `GrowSurfSDK`, `GrowSurfBranchAttribution`, `GrowSurfAdjustAttribution`, and `GrowSurfAppsFlyerAttribution`.

## 0.1.0

Initial public binary release of the GrowSurf iOS SDK.

- Adds the core `GrowSurfSDK` binary XCFramework.
- Adds optional Branch, Adjust, and AppsFlyer attribution adapter XCFrameworks.
- Adds Swift Package Manager binary targets with checksums.
- Adds CocoaPods binary podspec support with optional adapter subspecs.
- Supports iOS 15 and later.

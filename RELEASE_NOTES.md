# Release Notes

## 0.2.1

Security hardening for the native GrowSurf window cache and the in-window image loader.

- Encrypts the participant-scoped window cache via `NSFileProtectionCompleteUntilFirstUserAuthentication`, matching the Keychain accessibility used for tokens. Legacy `UserDefaults` cache entries are cleared on first use.
- Re-validates every redirect hop in the in-window remote image loader against the supported scheme allow-list to block downgrade attempts to non-`http(s)` schemes (e.g. `file:` / `jar:`).
- No public API or installation changes. Source-compatible upgrade from 0.2.0.

## 0.2.0

Adds the native GrowSurf window beta and expands attribution adapter coverage.

- Adds the `GrowSurfSingularAttribution` binary target, Swift package product, and CocoaPods subspec.
- Adds native GrowSurf window support for sharing, invites, referrals, rewards, leaderboard, affiliate summary, commissions, payouts, participant settings, FAQ, how-it-works, and terms sections.
- Keeps participant sharing centered on the canonical `shareUrl`.
- Refreshes Swift Package Manager checksums and CocoaPods binary source archives for every binary artifact.

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

# Release Notes

## 0.3.1

Tax Documentation support in the native GrowSurf window, Google Contacts fixes, and internal cleanup. Source-compatible upgrade from 0.3.0.

- Adds support for the Tax Documentation hosted action: when a campaign requires tax forms, the native window's participant settings expose a **Tax Forms** row that opens the secure hosted W-9 / W-8 flow (tax IDs never touch the app). Call `requestTaxInfoSession()` if you build a custom settings UI instead.
- Adds a native residency / VAT picker and an expanded country list (including Kosovo) for the hosted tax flow.
- Surfaces a clear "try again later" message when a tax-form submission hits a transient backend error.
- Fixes the native window's Google contacts list.
- Internal cleanup, campaign-driven copy, and parity fixes; no breaking public API changes.

## 0.3.0

Public API cleanup. Clean break from 0.2.1 (no shipped consumers, no back-compat shims).

- Participant-scoped methods no longer take a `participantId` argument. The SDK now decodes the participantId from the stored participant JWT and fills the URL path internally, so the participant token and participantId can no longer drift out of sync. Affected: `getParticipant`, `updateParticipant`, `getParticipantReferrals`, `getParticipantRewards`, `sendInvites`, `updateVanityLinks`, `getParticipantCommissions`, `markParticipantCommissionsRead`, `getParticipantPayouts`, `markParticipantPayoutsRead`, `getParticipantAffiliateSummary`, `getParticipantReferralSummary`, `requestPaypalConfirmEmail`, `markParticipantRewardsRead`, `trackShare`, `triggerReferral`.
- Adds `func currentParticipantId() async throws -> String?` returning the participantId from the stored participant JWT, or `nil` if none.
- Removes the public `createParticipant(_:)` method; use `addParticipant(_:)`.
- Removes the `updateParticipant(with: GrowSurfParticipantInput)` convenience overload; use the `GrowSurfParticipantUpdateInput` form.
- Collapses `updateVanityLink` + `updateVanityLinks` into a single `updateVanityLinks(vanityKeys: [String])`.
- `createSession()` and `recordAttribution(_:)` are now `internal`.
- `onParticipantCreated` in `GrowSurfWindowCallbacks` is now `(GrowSurfParticipant, String?) -> Void`, passing the new participant token alongside the participant.
- The four in-memory store classes (`GrowSurfMemoryTokenStore`, `GrowSurfMemoryAttributionStore`, `GrowSurfMemoryMobileInstanceIdStore`, `GrowSurfMemoryWindowCacheStore`) now use `package` access. Protocols and production defaults stay public.
- `presentGrowSurfWindow` now returns a public `GrowSurfWindowController` with a `close()` method for programmatic dismissal of the presented window.
- Server contract is unchanged; URL paths still carry `:participantId`, now filled locally from the JWT.
- `POST /session` now includes the device's `mobileInstanceId` in the request body so the server can scope the session rate limit per device instead of per IP. Multiple devices behind one NAT (office Wi-Fi, dev box + simulator + phone, CGNAT carrier) no longer share a single bucket. The SDK also retries `/session` once after a 1.5 s delay on a 429 response so a single hairline trip is absorbed silently instead of surfacing the raw rate-limit message in the GrowSurf window UI. Older servers that don't read `mobileInstanceId` ignore the field and continue per-IP limiting.
- The core `GrowSurfSDK` no longer depends on GoogleSignIn. The native window's Google contacts import uses a dependency-free external-browser sign-in flow by default; to use the native in-app Google Sign-In sheet instead, add the new optional `GrowSurfGoogleContacts` product (SPM) or `GrowSurfSDK/GoogleContacts` subspec (CocoaPods), which bundles GoogleSignIn. Apps that don't add it never link GoogleSignIn.

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

import Foundation
import GrowSurfSDK

#if os(iOS)
@preconcurrency import GoogleSignIn
import UIKit

// Optional GoogleSignIn integration for the GrowSurf native window's "import Google contacts" flow.
//
// The core `GrowSurfSDK` target has no GoogleSignIn dependency. Adding this product and calling
// `GrowSurfGoogleContacts.enable()` registers a GoogleSignIn-backed authorizer so the contacts import
// uses the native in-app Google sign-in sheet (instead of the core's dependency-free external-browser
// OAuth fallback). The consumer must configure a Google OAuth iOS client and its reversed URL scheme.
public enum GrowSurfGoogleContacts {
    private static let contactsScope = "https://www.googleapis.com/auth/contacts.readonly"

    // Registers the GoogleSignIn authorizer with the core SDK. Call once at app startup (e.g. in the
    // App initializer) before opening a GrowSurf window that offers Google contacts import. Also route
    // the OAuth callback URL through `GrowSurf.handleGoogleSignInURL(_:)` from your app's URL handler.
    @MainActor
    public static func enable() {
        GrowSurf.googleSignInAuthorizer = GrowSurfGoogleContactsAuthorizer()
    }
}

@MainActor
final class GrowSurfGoogleContactsAuthorizer: GrowSurfGoogleSignInAuthorizing {
    private static let contactsScope = "https://www.googleapis.com/auth/contacts.readonly"
    private static let peopleScopes = [contactsScope]
    // Proactively refresh access tokens expiring within this window so the People API call doesn't 401.
    private static let accessTokenRefreshGraceInterval: TimeInterval = 60

    func handleAuthorizationURL(_ url: URL) -> Bool {
        GIDSignIn.sharedInstance.handle(url)
    }

    func googleContactsAccessToken(
        clientID: String,
        iosURLScheme: String?,
        presenting viewController: UIViewController
    ) async throws -> String {
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
        let user = try await authorizedUser(clientID: clientID, presenting: viewController)
        let accessToken = user.accessToken.tokenString.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !accessToken.isEmpty else {
            throw GrowSurfGoogleContactsError.missingAccessToken
        }
        guard scopesSatisfied(user.grantedScopes) else {
            throw GrowSurfGoogleContactsError.missingContactsScope
        }
        return accessToken
    }

    private func scopesSatisfied(_ grantedScopes: [String]?) -> Bool {
        let grantedScopes = Set(grantedScopes ?? [])
        return Self.peopleScopes.allSatisfy(grantedScopes.contains)
    }

    private func accessTokenNeedsRefresh(expirationDate: Date?, now: Date = Date()) -> Bool {
        guard let expirationDate else { return false }
        return expirationDate.timeIntervalSince(now) <= Self.accessTokenRefreshGraceInterval
    }

    // Reuses a cached Google session only when it belongs to the requested OAuth client.
    private func authorizedUser(
        clientID: String,
        presenting viewController: UIViewController
    ) async throws -> GIDGoogleUser {
        if let currentUser = GIDSignIn.sharedInstance.currentUser,
           googleUser(currentUser, matchesClientID: clientID) {
            return try await authorizedUser(from: currentUser, presenting: viewController)
        } else if GIDSignIn.sharedInstance.currentUser != nil {
            GIDSignIn.sharedInstance.signOut()
        }
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            do {
                let restoredUser = try await restorePreviousSignIn()
                if googleUser(restoredUser, matchesClientID: clientID) {
                    return try await authorizedUser(from: restoredUser, presenting: viewController)
                }
                GIDSignIn.sharedInstance.signOut()
            } catch {
                let result = try await signIn(presenting: viewController)
                return result.user
            }
        }
        let result = try await signIn(presenting: viewController)
        return result.user
    }

    // Adds missing People API scopes, then refreshes only when the cached access token is stale.
    private func authorizedUser(
        from user: GIDGoogleUser,
        presenting viewController: UIViewController
    ) async throws -> GIDGoogleUser {
        let scopedUser: GIDGoogleUser
        if scopesSatisfied(user.grantedScopes) {
            scopedUser = user
        } else {
            let result = try await addScopes(Self.peopleScopes, to: user, presenting: viewController)
            scopedUser = result.user
        }
        guard scopesSatisfied(scopedUser.grantedScopes) else {
            throw GrowSurfGoogleContactsError.missingContactsScope
        }
        if !accessTokenNeedsRefresh(expirationDate: scopedUser.accessToken.expirationDate) {
            return scopedUser
        }
        do {
            return try await refreshedUser(scopedUser)
        } catch {
            let result = try await signIn(presenting: viewController)
            return result.user
        }
    }

    private func signIn(presenting viewController: UIViewController) async throws -> GIDSignInResult {
        try await withCheckedThrowingContinuation { continuation in
            GIDSignIn.sharedInstance.signIn(
                withPresenting: viewController,
                hint: nil,
                additionalScopes: Self.peopleScopes
            ) { result, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                guard let result else {
                    continuation.resume(throwing: GrowSurfGoogleContactsError.missingAccessToken)
                    return
                }
                continuation.resume(returning: result)
            }
        }
    }

    private func restorePreviousSignIn() async throws -> GIDGoogleUser {
        try await withCheckedThrowingContinuation { continuation in
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                guard let user else {
                    continuation.resume(throwing: GrowSurfGoogleContactsError.missingAccessToken)
                    return
                }
                continuation.resume(returning: user)
            }
        }
    }

    private func addScopes(
        _ scopes: [String],
        to user: GIDGoogleUser,
        presenting viewController: UIViewController
    ) async throws -> GIDSignInResult {
        try await withCheckedThrowingContinuation { continuation in
            user.addScopes(scopes, presenting: viewController) { result, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                guard let result else {
                    continuation.resume(throwing: GrowSurfGoogleContactsError.missingAccessToken)
                    return
                }
                continuation.resume(returning: result)
            }
        }
    }

    private func refreshedUser(_ user: GIDGoogleUser) async throws -> GIDGoogleUser {
        try await withCheckedThrowingContinuation { continuation in
            user.refreshTokensIfNeeded { refreshedUser, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                guard let refreshedUser else {
                    continuation.resume(throwing: GrowSurfGoogleContactsError.missingAccessToken)
                    return
                }
                continuation.resume(returning: refreshedUser)
            }
        }
    }

    private func googleUser(_ user: GIDGoogleUser, matchesClientID clientID: String) -> Bool {
        user.configuration.clientID.trimmingCharacters(in: .whitespacesAndNewlines) == clientID
    }
}

enum GrowSurfGoogleContactsError: Error, Equatable {
    case missingAccessToken
    case missingContactsScope
}
#endif

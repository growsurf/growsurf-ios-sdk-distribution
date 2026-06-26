Pod::Spec.new do |s|
  s.name = 'GrowSurfSDK'
  s.version = '0.3.1'
  s.summary = 'Swift SDK for GrowSurf mobile referral attribution and the native GrowSurf window.'
  s.description = 'GrowSurfSDK provides native iOS referral attribution, participant creation, sharing, participant-scoped referral portal access, and the experimental native GrowSurf window.'
  s.homepage = 'https://docs.growsurf.com/developer-tools/ios-sdk'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'GrowSurf' => 'support@growsurf.com' }
  s.platform = :ios, '15.0'
  s.swift_versions = ['6.0']
  s.source = {
    :http => 'https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v0.3.1/GrowSurfSDK-CocoaPods-0.3.1.zip'
  }
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.vendored_frameworks = 'GrowSurfSDK.xcframework'
  end

  # Optional GoogleSignIn-backed contacts import for the native window. Ships as source (a thin
  # GoogleSignIn shim layered on the binary Core) rather than a vendored framework, because a binary
  # XCFramework cannot carry the external GoogleSignIn dependency. Keeping it off the default Core
  # subspec means consumers who don't import Google contacts never pull in GoogleSignIn.
  s.subspec 'GoogleContacts' do |google|
    google.dependency 'GrowSurfSDK/Core'
    google.dependency 'GoogleSignIn', '~> 9.1'
    google.source_files = 'GrowSurfGoogleContacts/**/*.swift'
  end

  s.subspec 'BranchAttribution' do |branch|
    branch.dependency 'GrowSurfSDK/Core'
    branch.vendored_frameworks = 'GrowSurfBranchAttribution.xcframework'
  end

  s.subspec 'AdjustAttribution' do |adjust|
    adjust.dependency 'GrowSurfSDK/Core'
    adjust.vendored_frameworks = 'GrowSurfAdjustAttribution.xcframework'
  end

  s.subspec 'AppsFlyerAttribution' do |appsflyer|
    appsflyer.dependency 'GrowSurfSDK/Core'
    appsflyer.vendored_frameworks = 'GrowSurfAppsFlyerAttribution.xcframework'
  end

  s.subspec 'SingularAttribution' do |singular|
    singular.dependency 'GrowSurfSDK/Core'
    singular.vendored_frameworks = 'GrowSurfSingularAttribution.xcframework'
  end
end

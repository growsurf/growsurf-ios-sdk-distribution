Pod::Spec.new do |s|
  s.name = 'GrowSurfSDK'
  s.version = '0.8.0'
  s.summary = 'Swift SDK for GrowSurf mobile referral attribution and the native GrowSurf window.'
  s.description = 'GrowSurfSDK provides native iOS referral attribution, participant creation, sharing, participant-scoped referral portal access, and the experimental native GrowSurf window.'
  s.homepage = 'https://docs.growsurf.com/developer-tools/ios-sdk'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'GrowSurf' => 'support@growsurf.com' }
  s.platform = :ios, '15.0'
  s.swift_versions = ['6.0']
  # Both version segments interpolate `s.version` so a version bump cannot leave this URL pointing at
  # the previous release's zip. `scripts/build-xcframeworks.sh` copies this file verbatim into the
  # release dir, and the release workflow only compares the git tag to `s.version` — a hardcoded URL
  # here lints clean and publishes a podspec that downloads the wrong artifact.
  s.source = {
    :http => "https://github.com/growsurf/growsurf-ios-sdk-distribution/releases/download/v#{s.version}/GrowSurfSDK-CocoaPods-#{s.version}.zip"
  }
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.vendored_frameworks = 'GrowSurfSDK.xcframework'
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

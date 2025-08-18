platform :ios, '12.0'
use_frameworks!
use_modular_headers!

# Use CocoaPods CDN
source 'https://cdn.cocoapods.org/'

target 'Runner' do
  # Flutter pods
  pod 'Flutter', :path => 'ios/Flutter'

  # Plugin pods
  pod 'cloud_firestore', '~> 12.0'
  pod 'firebase_core', '~> 2.21.0'
  pod 'flutter_local_notifications', '~> 19.4.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # Disable code signing for unsigned builds
      config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
    end
  end
end

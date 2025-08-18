platform :ios, '15.0'

use_frameworks!
use_modular_headers!

target 'Runner' do
  # Add any plugins manually here if needed
  pod 'cloud_firestore', '~> 12.0'
  pod 'firebase_auth', '~> 12.0'
  pod 'firebase_core', '~> 12.0'
  pod 'flutter_local_notifications', '~> 19.4.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end

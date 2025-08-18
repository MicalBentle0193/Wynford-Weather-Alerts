platform :ios, '15.0'

project 'ios/Runner.xcodeproj'

use_frameworks!
use_modular_headers!

target 'Runner' do
  # Pods for Flutter plugins
  # Add any specific pods you need here, e.g.:
  # pod 'Firebase/Analytics'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
    end
  end
end

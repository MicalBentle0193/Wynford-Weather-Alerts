platform :ios, '15.0'

ENV['COCOAPODS_DISABLE_STATS'] = 'true'

# Point to your Xcode project inside ios/
project 'ios/Runner.xcodeproj'

use_frameworks!
use_modular_headers!

# Flutter Pod helper
require File.expand_path(File.join('packages', 'flutter_tools', 'bin', 'podhelper'), flutter_root)

flutter_ios_podfile_setup

target 'Runner' do
  # Install all Flutter plugins
  install_all_flutter_pods File.dirname(File.realpath(__FILE__))
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
  end
end

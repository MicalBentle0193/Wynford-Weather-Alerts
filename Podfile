platform :ios, '12.0'

# Explicitly tell CocoaPods which Xcode project to use
project 'ios/Runner.xcodeproj'

# CocoaPods analytics mess with automation
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

# Flutter Pod helper
flutter_application_path = File.expand_path('ios/Flutter')
eval(File.read(File.join(flutter_application_path, 'podhelper.rb')), binding)

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end

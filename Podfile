# Uncomment this line to define a global platform for your project
platform :ios, '12.0'

# Tell CocoaPods where the Xcode project is
project 'ios/Runner.xcodeproj'

# Set the Flutter application path (fixes missing podhelper.rb)
flutter_application_path = File.expand_path('ios/Flutter', __dir__)
eval(File.read(File.join(flutter_application_path, 'podhelper.rb')), binding)

target 'Runner' do
  use_frameworks!
  use_modular_headers!

  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
  end
end

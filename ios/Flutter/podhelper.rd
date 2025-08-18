# ios/Flutter/podhelper.rb

def parse_KV_file(file, separator='=')
  file_abs_path = File.expand_path(file)
  if !File.exists? file_abs_path
    return [];
  end
  pods_ary = []
  skip_line_start_symbols = ["#", "/"]
  File.foreach(file_abs_path) do |line|
    next if skip_line_start_symbols.any? { |symbol| line.strip.start_with?(symbol) }
    plugin = line.split(pattern=separator)
    if plugin.length == 2
      podname = plugin[0].strip
      path = plugin[1].strip
      pods_ary.push({:name => podname, :path => path});
    else
      puts "Invalid plugin specification: #{line}"
    end
  end
  return pods_ary
end

def flutter_root
  generated_xcode_build_settings_path = File.expand_path(File.join('..', 'Flutter', 'Generated.xcconfig'), __FILE__)
  unless File.exist?(generated_xcode_build_settings_path)
    raise "#{generated_xcode_build_settings_path} must exist. Run `flutter pub get` first."
  end

  File.foreach(generated_xcode_build_settings_path) do |line|
    matches = line.match(/FLUTTER_ROOT\=(.*)/)
    return matches[1].strip if matches
  end
  raise "FLUTTER_ROOT not found in #{generated_xcode_build_settings_path}"
end

def flutter_application_path
  File.expand_path('..', __dir__)
end

def flutter_ios_engine_path
  File.expand_path('engine', flutter_root)
end

def flutter_podhelper_path
  File.expand_path(File.join('packages', 'flutter_tools', 'bin', 'podhelper.rb'), flutter_root)
end

def flutter_install_ios_engine_pod
  engine_dir = flutter_ios_engine_path
  if !File.exist?(engine_dir)
    raise "Engine not found at #{engine_dir}. Run `flutter precache` first."
  end
  pod 'Flutter', :path => File.join(engine_dir, 'Flutter.podspec')
end

def flutter_install_all_ios_pods(ios_application_path = nil)
  ios_application_path ||= File.expand_path('..', __dir__)

  # Add Flutter engine
  flutter_install_ios_engine_pod

  # Add plugin pods
  plugin_pods = parse_KV_file(File.join(ios_application_path, '.flutter-plugins-dependencies'))
  plugin_pods.each do |plugin|
    pod plugin[:name], :path => plugin[:path]
  end
end

def flutter_additional_ios_build_settings(target)
  target.build_configurations.each do |config|
    config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
  end
end

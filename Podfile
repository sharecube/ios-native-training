# Uncomment the next line to define a global platform for your project
platform :ios, '16.0'

install! 'cocoapods', :disable_input_output_paths => true, :warn_for_unused_master_specs_repo => false

use_frameworks!
inhibit_all_warnings!

# https://github.com/strongself/Generamba/wiki/Rambafile-Structure
# https://github.com/strongself/Generamba

target 'SwiftCoreTraining' do
  
  use_frameworks!
  inhibit_all_warnings!
  
  # UI
  pod 'Eureka', '~> 5.4.0'
  pod 'DZNEmptyDataSet', '~> 1.8.1'
  pod 'SnapKit', '~> 5.0.1'
  pod 'R.swift', '~> 6.1.0'
  pod 'Closures', '~> 0.7'
  pod 'SVProgressHUD', '~> 2.3.1'
  
  # Networking
  pod 'Kingfisher', '~> 7.10.2'
  
  # Social auth - Facebook
  pod 'FacebookCore', '~> 0.9.0'
      
  # Database
  pod 'RealmSwift', '~> 10.46.0'
  
  # WebSockets
  pod 'Starscream', '~> 3.1'
  pod 'Socket.IO-Client-Swift', '~> 15.2.0'
  
  # HTML Parsing
  pod 'Kanna', '~> 5.2.7'
  
  #Objc Pods
  pod 'Masonry', '~> 1.1.0'
  pod 'SDWebImage', '~> 5.18.10'

  target 'SwiftCoreTrainingTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SwiftCoreTrainingUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  post_install do |installer|
     installer.pods_project.targets.each do |target|
           target.build_configurations.each do |config|
               config.build_settings['ENABLE_BITCODE'] = 'NO'
               config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
               if config.name == 'Debug' || config.name == 'Debug-MockAPI'
                 config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
                 config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
               end
       end
     end
   end
  
end

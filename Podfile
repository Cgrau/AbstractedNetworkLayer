# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
inhibit_all_warnings!

def testing_pods
 use_frameworks!
 pod 'RxBlocking', '5.0'
 pod 'OHHTTPStubs/Swift'
end

def app_pods
  use_frameworks!
  pod 'Sourcery'
  pod 'RxSwift',    '5.0'
  pod 'RxCocoa',    '5.0'
  pod 'Moya', '14.0.0'
  pod 'Moya/RxSwift', '14.0.0'
  pod 'SwiftLint'
end

target 'NetworkLayerRx' do
  app_pods
end

target 'NetworkLayerRxTests' do
  testing_pods
end

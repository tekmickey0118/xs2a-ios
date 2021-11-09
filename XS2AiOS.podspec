Pod::Spec.new do |s|
  s.name             = 'XS2AiOS'
  s.version          = '1.0.4'
  s.summary          = 'Native integration of FinTecSystems XS2A API for your iOS apps.'

  s.homepage         = 'https://github.com/FinTecSystems/xs2a-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FinTecSystems GmbH' => 'support@fintecsystems.com' }
  s.source           = { :git => 'https://github.com/FinTecSystems/xs2a-ios.git', :tag => s.version.to_s }

  s.dependency		'SwiftyJSON', '5.0.1'
  s.dependency		'NVActivityIndicatorView', '5.1.1'
  s.dependency		'XS2AiOSNetService', '1.0.4'

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.3'

  s.source_files = 'Sources/XS2AiOS/**/*.swift'
  s.resource_bundle = { "XS2AiOS" => ['Sources/XS2AiOS/Resources/**/*'] }
end
Pod::Spec.new do |s|
  s.name     = 'UDCSRTResponseSerializer'
  s.version  = '0.0.1'
  s.license  = 'Unlicense'
  s.summary  = 'A response serializer you can plug in to AFNetworking that parses an SRT file and returns it in a friendly format.'
  s.homepage = 'https://github.com/udacity/UDCSRTResponseSerializer'
  s.social_media_url = 'https://twitter.com/olivercameron'
  s.authors  = { 'Oliver Cameron' => 'olivercameron@icloud.com' }
  s.source   = { :git => 'https://github.com/udacity/UDCSRTResponseSerializer.git', :tag => 'v0.0.1' }
  s.source_files = 'Classes'
  s.requires_arc = true

  s.ios.deployment_target = '7.0'

  s.dependency 'AFNetworking'
end
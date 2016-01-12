Pod::Spec.new do |s|
  s.name = 'VJOvalPageSwitch'
  s.version = '0.0.5'
  s.license = 'MIT'
  s.summary = 'An customizable page control on iOS.'
  s.homepage = 'https://github.com/Vincent7/VJOvalPageSwitch'
  s.authors = { 'Vincent7' => 'and7@live.cn' }
  s.source = { :git => 'https://github.com/Vincent7/VJOvalPageSwitch.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '7.0'
  s.source_files = 'VJOvalPageSwitch/VJPageControl/*.{h,m}'
  s.requires_arc = true
end

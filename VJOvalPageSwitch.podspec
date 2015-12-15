Pod::Spec.new do |s|
  s.name = 'VJOvalPageSwtichTProject'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'An customizable page control on iOS.'
  s.homepage = 'https://github.com/Vincent7/VJOvalPageSwtichTProject'
  s.authors = { 'Vincent7' => 'and7@live.cn' }
  s.source = { :git => 'https://github.com/Vincent7/VJOvalPageSwtichTProject.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.source_files = 'VJOvalPageSwtichTProject/VJPageControl/*.{h,m}'
  s.requires_arc = true
end

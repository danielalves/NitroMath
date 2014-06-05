Pod::Spec.new do |s|
  s.name         = 'NitroMath'
  s.version      = '1.1.0'
  s.summary      = 'NitroMath is a set of mathematical utilities for C, C++, ObjC and Swift which aims to boost coding performance.'
  s.homepage     = 'https://github.com/danielalves/NitroMath'
  s.license      = 'MIT'
  s.author       = 'Daniel L. Alves'
  s.source       = { :git => 'https://github.com/danielalves/NitroMath.git', :tag => s.version.to_s }
  s.source_files  = 'NitroMath/**/NTRMath.h'
  s.requires_arc = false
end

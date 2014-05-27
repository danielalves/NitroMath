Pod::Spec.new do |s|
  s.name         = "NitroMath"
  s.version      = "1.0.0"
  s.summary      = "Nitro math is a set of mathematical utilities for C, C++ and ObjC which aims to boost coding performance."
  s.homepage     = "https://github.com/danielalves/nitro-math"
  s.license      = "MIT"
  s.author       = "Daniel L. Alves"
  s.source       = { :git => "https://github.com/danielalves/nitro-math.git", :tag => s.version.to_s }
  s.source_files  = "NitroMath"
  s.requires_arc = false
end

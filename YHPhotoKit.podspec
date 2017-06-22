Pod::Spec.new do |s|
  s.name             = "YHPhotoKit"
  s.version          = "0.2.0"
  s.summary          = "A photo kit on iOS."
  s.description      = <<-DESC
                       It is a photo kit used on iOS, which implement by Objective-C.
                       DESC
  s.homepage         = "https://github.com/dengyhgit/YHPhotoKit"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "DengYonghao" => "cbyniypeu@163.com" }
  s.source           = { :git => "https://github.com/dengyhgit/YHPhotoKit.git", :tag => s.version.to_s }


  s.platform     = :ios, '6.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'YHPhotoKit/**/*'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'UIKit'

end

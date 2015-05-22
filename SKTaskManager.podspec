#
# Be sure to run `pod lib lint SKTaskManager.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SKTaskManager"
  s.version          = "1.0"
  s.summary          = "Now its easy to manage asynchronous task whether its is sequential or parallel."
  s.homepage         = "https://github.com/SunilSpaceo/SKTaskManager"
  s.license          = 'MIT'
  s.author           = { "SunilSpaceo" => "sunil@spaceotechnologies.com" }
  s.source           = { :git => "https://github.com/SunilSpaceo/SKTaskManager.git", :tag => '1.0' }

  s.platform     = :ios, '5.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.{h,m}'

# 	s.public_header_files = 'Pod/Classes/**/*.h'
end

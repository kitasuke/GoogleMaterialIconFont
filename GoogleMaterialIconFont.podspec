#
# Be sure to run `pod lib lint GoogleMaterialIconFont.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GoogleMaterialIconFont"
  s.version          = "0.5.0"
  s.summary          = "Google Material Design Icons for ObjC or Swift project"
  s.homepage         = "https://github.com/kitasuke/GoogleMaterialIconFont"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "kitasuke" => "yusuke2759@gmail.com" }
  s.source           = { :git => "https://github.com/kitasuke/GoogleMaterialIconFont.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'GoogleMaterialIconFont' => ['Pod/Assets/*.ttf']
  }
end

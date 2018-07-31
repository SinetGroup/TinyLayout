#
# Be sure to run `pod lib lint EZLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EZLayout'
  s.version          = '0.1.0'
  s.summary          = 'A short description of EZLayout.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/SinetGroup/EZLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LookForward' => 'teterin1vl@gmail.com' }
  s.source           = { :git => 'https://github.com/SinetGroup/EZLayout.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'EZLayout/Classes/**/*'

  s.frameworks = 'UIKit'
end

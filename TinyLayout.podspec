Pod::Spec.new do |s|
    s.name             = 'TinyLayout'
    s.version          = '1.0.0'
    
    s.summary          = 'Human-friendly autolayout. So sweet!'
    s.description      = <<-DESC
        With Tiny Constraints you forgot about ugly view.firstBaselineAnchor.constraint(blah-blah-blah)
    DESC
    
    s.homepage         = 'https://github.com/SinetGroup/TinyLayout'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'SinetGroup' => 'office@yaknet.com' }
    s.source           = { :git => 'https://github.com/SinetGroup/TinyLayout.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '9.0'
    s.source_files = 'TinyLayout/Classes/**/*'
    s.swift_version = '4'
end

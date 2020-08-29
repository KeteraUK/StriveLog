#
#  Be sure to run `pod spec lint StriveHealth.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

#
#  Be sure to run `pod spec lint StriveHealth.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
    s.name             = 'StriveLog'
    s.version          = '1.0.0'
    s.summary          = 'A short description of StriveLog.'
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
    s.description      = "test"
  
    s.homepage         = 'https://github.com/KeteraUK/StriveLog'
    s.author             = { "author" => "luke@ketera.io" }
    s.source           = { :git => 'https://github.com/KeteraUK/StriveLog.git', :tag => "#{s.version}" }
    s.platforms = { :ios => "13.0" }
    s.swift_version = "5.0"
    s.ios.deployment_target = '13.0'
    s.source_files  = "Sources/StriveLog/**/*.swift"
  end
  
#
#  Be sure to run `pod spec lint WSModallyTransition.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "WSModallyTransition"
  s.version      = "0.0.2"
  s.summary      = "一个类似于系统alterView和actionSheet的模态弹出和消失的转场动画，可用于快速自定义alterView和actionSheet."
  s.description  = <<-DESC
                    * 一个类似于系统alterView和actionSheet的模态弹出和消失的转场动画
                    * 可用于快速自定义alterView和actionSheet
                    * 界面完全可自定义
                   DESC

  s.homepage     = "https://github.com/ONECATYU/WSModallyTransition"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "capsule" => "786910875@qq.com" }
  # Or just: s.author    = ""
  # s.authors            = { "" => "" }
  # s.social_media_url   = "http://twitter.com/"

  s.platform     = :ios, "8.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/ONECATYU/WSModallyTransition.git", :tag => s.version.to_s }

  s.source_files  = "WSTransition", "WSTransition/**/*.{h,m}"

  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end

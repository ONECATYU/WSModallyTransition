
Pod::Spec.new do |s|

  s.name         = "WSModallyTransition"
  s.version      = "0.0.4"
  s.summary      = "一个类似于系统alterView和actionSheet的模态弹出和消失的转场动画，可用于快速自定义alterView和actionSheet."
  s.description  = <<-DESC
                    * 一个类似于系统alterView和actionSheet的模态弹出和消失的转场动画
                    * 可用于快速自定义alterView和actionSheet
                    * 界面完全可自定义
                   DESC
  s.homepage     = "https://github.com/ONECATYU/WSModallyTransition"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "capsule" => "786910875@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ONECATYU/WSModallyTransition.git", :tag => s.version.to_s }
  s.source_files  = "WSTransition", "WSTransition/**/*.{h,m}"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true

end

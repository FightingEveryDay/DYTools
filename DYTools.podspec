Pod::Spec.new do |s|
  s.name         = "DYTools"
  s.version      = “1.0.0”
  s.summary      = "Tools of iOS"
  s.description  = '一组有用的工具集'
  s.homepage     = "https://github.com/FightingEveryDay/DYTools"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "FightingEveryDay" => "wdy19921117@gmail.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/FightingEveryDay/DYTools.git", :tag => "#{s.version}" }
  s.source_files  = "DYTools", "DYTools/**/*.{h,m}"
  s.exclude_files = "DYToolsDemo"
  s.requires_arc = true
  # s.dependency "JSONKit", "~> 1.4"
end

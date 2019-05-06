#
# Be sure to run `pod lib lint XMTabBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XMTabBar'
  s.version          = '0.1.0'
  s.summary          = '为TabBar点击添加动画效果.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        暂时为TabBar的提供四种点击动画效果:1、弹跳动画 2、缩放动画 3、翻转动画 4、粒子爆炸动画.
                       DESC

  s.homepage         = 'https://github.com/ixmwl/XMTabBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ixmwl' => 'ixmwl510@163.com' }
  s.source           = { :git => 'https://github.com/ixmwl/XMTabBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'XMTabBar/Classes/**/*'
  
  # s.resource_bundles = {
  #   'XMTabBar' => ['XMTabBar/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

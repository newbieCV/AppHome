# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

post_install do |installer_representation|
  # 解决引用三方库不能在arm64机器编译
  installer_representation.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end
  end
  installer_representation.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
end

target 'AppHome' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for AppHome
  
  ## 数据层面
  # 网络请求，OC使用AFNetworking
  pod 'Alamofire', '~> 5.6.4'
  # 数据解析
  pod 'YYModel', '~> 1.0.4'
  # 图片下载 & 缓存图片
  pod 'Kingfisher', '~> 7.6.2'
  #
  ## UI相关
  # layout布局，OC使用Masonry
  pod 'SnapKit', '~> 5.6.0'
  # 自己封装的一些UI基础组件
  pod 'AHComponents', :path => '../AHComponents'
  # DEBUG环境下查看视图层级
  pod 'LookinServer', :configurations => ['Debug']
  
end

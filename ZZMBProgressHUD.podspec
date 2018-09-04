

Pod::Spec.new do |s|

  s.name         = "ZZMBProgressHUD"
  s.version      = "1.0.2"
  s.summary      = "基于MBProgressHUD的简单封装"
  s.description  = <<-DESC
这是我第一次建立pod仓库demo，基于MBProgressHUD的简单封装
                   DESC

  s.homepage     = "https://zzjustinForever:yy199208051923@github.com/justinFirstGame/ZZMBProgressHUD"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "zz" => "zz_justforever@163.com" }

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://zzjustinForever:yy199208051923@github.com/justinFirstGame/ZZMBProgressHUD.git", :tag => "#{s.version}" }

  s.source_files  = "MBProgressCategory", "ZZMBProgressHUD/MBProgressCategory/*.{h,m}"



  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.
 s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency "MBProgressHUD"

end

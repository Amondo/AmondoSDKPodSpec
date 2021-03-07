Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '10.0'
s.name = "AmondoSDK"
s.summary = "AmondoSDK gives access to the Amondo Imprints."
s.requires_arc = true
s.static_framework = true
s.swift_version = '4.2'
s.exclude_files = "AmondoSDK/**/*.plist"

# 2
s.version = "0.7.3"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Amondo" => "developer@amondo.com" }

# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/Amondo/"


# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "git@github.com:Amondo/AmondoSDK-iOS.git", :tag => "#{s.version}"}


# 7
s.framework = "UIKit"
s.dependency 'Alamofire', '4.8.2'
s.dependency 'KeychainSwift', '16.0.1'
s.dependency 'Cloudinary', '2.7.0'
s.dependency 'FacebookShare', '0.8.0'
s.dependency 'Intercom', '5.1.6'
s.dependency 'Apollo', '0.18.1'

# 8
s.source_files = "AmondoSDK/**/*.{swift}"

# 9
s.resources = "AmondoSDK/**/*.{png,xib,jpeg,jpg,storyboard,xcassets,plist,otf}"

end




Pod::Spec.new do |spec|


  spec.name         = "WK2JavaScriptBridge"
  spec.version      = "1.0.5"
  spec.summary      = "基于WKWebView构建的JSBridge，支持iOS8+。"
  spec.homepage     = "https://github.com/zanjs/WKJavaScriptBridge"
  spec.license      = { :type => "Apache License 2.0", :file => "LICENSE" }
  spec.author             = { "Julian" => "suihuasheng@gmial.com" }
  spec.source       = { :git => "https://github.com/zanjs/WKJavaScriptBridge.git", :tag => "#{spec.version}" }
  spec.platform = :ios, '8.0'
  spec.resources = "WKJavaScriptBridge/WKJSBridge.js"
  spec.frameworks = "WebKit"
end



Pod::Spec.new do |spec|


  spec.name         = "WK2JavaScriptBridge"
  spec.version      = "1.0.3"
  spec.summary      = "基于WKWebView构建的JSBridge，支持iOS8+。"
  spec.homepage     = "https://zanjs.com"
  spec.license      = { :type => "Apache License 2.0", :file => "LICENSE" }
  spec.author             = { "Julian" => "suihuasheng@gmial.com" }
  spec.source       = { :git => "https://github.com/zanjs/WKJavaScriptBridge.git", :tag => "#{spec.version}" }
  spec.source_files  = "WKJavaScriptBridge-demo/WKJavaScriptBridge-demo/WKJavaScriptBridge/**/*"
  spec.platform = :ios, '8.0'
  spec.resources = "WKJavaScriptBridge/WKJSBridge.js"
  spec.frameworks = "WebKit"
end

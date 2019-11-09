# WKJavaScriptBridge


## 特性

- 一行代码集成。
- 异步调用。
- 支持业务模块化分离。
- 支持业务模块白名单机制，提升安全性。


## 安装

### 方法一:Cocoapods
- 1、:

```objc
在Podfile文件里面添加:pod 'WKJavaScriptBridge'
```
- 2、:对应文件添加头文件

```objc
#import "WKJavaScriptBridge.h"
```

### 方法二:手动添加
- 1、下载WKJavaScriptBridge，将WKJavaScriptBridge文件夹拖入到你的工程中

- 2、引入头文件:

```objc
#import "WKJavaScriptBridge.h"
```


## 用法
- 1、:

```objc
//在使用Bridge的类扩展中加入
@property (nonatomic, strong) WKJavaScriptBridge *bridge;
```
- 2、:

```objc
//在创建WKWebView的地方调用此方法，绑定你的WebView
self.bridge = [WKJavaScriptBridge bindBridgeWithWebView:yourwebView];
```
- 3、:

```objc
//开启白名单，默认关闭。若开启，插件需要进行注册`@WKRegisterWhiteList(你的模块类名)`，参照DEMO。
[self.bridge openWhiteList:YES];
```
- 4、:

```objc
h5页面引入：<script type="text/javascript" src="WKJSBridge.js" ></script>
```
- 5、:

```objc
//H5调用Native：
window.WKJSBridge.callNative(service, action, command, function success(res) {}, function fail(res) {});
service：Native类名
action：Native方法名
command：参数
function success(res) {}：成功回调函数
function fail(res) {}：失败回调函数

//Native回调H5：
- (void)sendPluginResult:(WKPluginResult *)result callbackId:(NSString*)callbackId;
result：参数
callbackId：H5传过来的回调ID
```

## 延伸
- 1、:
```objc
构建离线包
```
- 2、:
```objc
构建小程序
```

## License

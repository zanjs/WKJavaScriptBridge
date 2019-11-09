//
//  WKCommandImpl.h
//  WKJavaScriptBridge-demo
//
//  Created by Kevin on 2019/10/22.
//  Copyright © 2019 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKCommandProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class WKJavaScriptBridge;

@interface WKCommandImpl : NSObject<WKCommandProtocol>
- (instancetype)initWithBridge:(WKJavaScriptBridge *)bridge;
@end

NS_ASSUME_NONNULL_END

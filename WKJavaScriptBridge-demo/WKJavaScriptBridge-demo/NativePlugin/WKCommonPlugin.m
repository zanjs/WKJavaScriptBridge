//
//  WKCommonPlugin.m
//  WKJavaScriptBridge-demo
//
//  Created by Kevin on 2019/10/22.
//  Copyright © 2019 Julian. All rights reserved.
//

#import "WKCommonPlugin.h"

@WKRegisterWhiteList(WKCommonPlugin)

@implementation WKCommonPlugin

- (void)asynDisplayCommon:(WKMsgCommand *)command {
    NSString *string = [command.arguments objectForKey:@"url"];
    NSLog(@"url : %@", string);
    
    WKPluginResult *result = [WKPluginResult resultWithStatus:WKJavaScriptBridgeCommandStatus_OK messageAsDictionary:@{@"result": @"success!!"}];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end

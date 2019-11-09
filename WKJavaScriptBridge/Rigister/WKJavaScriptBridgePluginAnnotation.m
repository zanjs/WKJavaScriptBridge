//
//  WKJavaScriptBridgePluginAnnotation.m
//  WKJavaScriptBridge-demo
//
//  Created by Kevin on 2019/10/22.
//  Copyright © 2019 Julian. All rights reserved.
//

#import "WKJavaScriptBridgePluginAnnotation.h"
#import "WKJavaScriptBridge.h"
#include <mach-o/getsect.h>
#include <mach-o/loader.h>
#include <mach-o/dyld.h>
#include <dlfcn.h>
#import <objc/runtime.h>
#import <objc/message.h>
#include <mach-o/ldsyms.h>

@interface WKJavaScriptBridgePluginAnnotation ()

@property (nonatomic, weak) WKJavaScriptBridge *bridge;

@end

@implementation WKJavaScriptBridgePluginAnnotation

- (instancetype)initWithBridge:(WKJavaScriptBridge *)bridge {
    if (self = [super init]) {
        self.bridge = bridge;
    }
    return self;
}

- (void)getAllRegisterPluginName {
    [self registedAnnotationModules];
}

- (void)registedAnnotationModules {
    NSArray<NSString *>*services = [WKJavaScriptBridgePluginAnnotation AnnotationModules];
    for (NSString *pluginName in services) {
        if (pluginName) {
            [self.bridge addWhiteList:pluginName];
        }
    }
}

+ (NSArray<NSString *> *)AnnotationModules {
    static NSArray<NSString *> *mods = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mods = BHReadConfiguration(WKWebPlugins);
    });
    return mods;
}

static NSArray<NSString *>* BHReadConfiguration(char *section) {
    NSMutableArray *configs = [NSMutableArray array];
    
    Dl_info info;
    dladdr(BHReadConfiguration, &info);
    
#ifndef __LP64__
    const struct mach_header *mhp = (struct mach_header*)info.dli_fbase;
    unsigned long size = 0;
    uint32_t *memory = (uint32_t*)getsectiondata(mhp, "__DATA", section, & size);
#else /* defined(__LP64__) */
    const struct mach_header_64 *mhp = (struct mach_header_64*)info.dli_fbase;
    unsigned long size = 0;
    uint64_t *memory = (uint64_t*)getsectiondata(mhp, "__DATA", section, & size);
#endif /* defined(__LP64__) */
    for(int idx = 0; idx < size/sizeof(void*); ++idx){
        char *string = (char*)memory[idx];
        
        NSString *str = [NSString stringWithUTF8String:string];
        if(!str)continue;
#ifdef DEBUG
        NSLog(@"config = %@", str);
#endif
        if(str) [configs addObject:str];
    }
    
    return configs;
}

@end

//
//  NSObject+FMSwizzling.m
//  FMListPlaceholderExample
//
//  Created by Mingo on 2018/8/9.
//  Copyright © 2017年 袁凤鸣. All rights reserved.
//  项目地址：https://github.com/yfming93/FMListPlaceholder
//  作者博客：https://www.yfmingo.cn
//

#import "NSObject+FMSwizzling.h"
@implementation NSObject (FMSwizzling)

+ (void)fm_methodSwizzlingWithOriginalSelector:(SEL)originalSelector
                         bySwizzledSelector:(SEL)swizzledSelector {
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class,originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end

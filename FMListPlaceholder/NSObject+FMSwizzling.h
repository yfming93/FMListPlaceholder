//
//  NSObject+FMSwizzling.h
//  FMListPlaceholderExample
//
//  Created by Mingo on 2018/8/9.
//  Copyright © 2017年 袁凤鸣. All rights reserved.
//  项目地址：https://github.com/yfming93/FMListPlaceholder
//  作者博客：https://www.yfmingo.cn
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface NSObject (FMSwizzling)

+ (void)fm_methodSwizzlingWithOriginalSelector:(SEL)originalSelector
                         bySwizzledSelector:(SEL)swizzledSelector;

@end

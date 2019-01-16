//
//  NSBundle+FMListPlaceholder.m
//  FMListPlaceholderExample
//
//  Created by Mingo on 2018/8/9.
//  Copyright © 2017年 袁凤鸣. All rights reserved.
//  项目地址：https://github.com/yfming93/FMListPlaceholder
//  作者博客：https://www.yfmingo.cn
//

#import "NSBundle+FMListPlaceholder.h"

#import "FMListPlaceholder.h"

@implementation NSBundle (FMListPlaceholder)

+ (instancetype)fm_listPlaceholderBundle
{
    static NSBundle *fmListPlaceholderBundle = nil;
    if (fmListPlaceholderBundle == nil) {
        fmListPlaceholderBundle = [NSBundle bundleForClass:[FMListPlaceholder class]];
    }
    return fmListPlaceholderBundle;
}

+ (UIImage *)fm_coverImage
{
    static UIImage *coverImage = nil;
    if (coverImage == nil) {
        NSString *path = [[self fm_listPlaceholderBundle] pathForResource:@"fm_emptylist_placeholder@2x" ofType:@"png"];
        coverImage = [[UIImage imageWithContentsOfFile:path] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return coverImage;
}
@end

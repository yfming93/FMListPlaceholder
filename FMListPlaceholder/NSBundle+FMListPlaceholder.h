//
//  NSBundle+FMListPlaceholder.h
//  FMListPlaceholderExample
//
//  Created by Mingo on 2018/8/9.
//  Copyright © 2017年 袁凤鸣. All rights reserved.
//  项目地址：https://github.com/yfming93/FMListPlaceholder
//  作者博客：https://www.yfmingo.cn
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSBundle (FMListPlaceholder)
/// 获取当前库的资源包
+ (instancetype)fm_listPlaceholderBundle;
/// 获取系统默认占位图
+ (UIImage *)fm_coverImage;

@end

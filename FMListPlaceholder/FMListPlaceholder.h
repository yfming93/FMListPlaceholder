//
//  FMListPlaceholder.h
//  FMListPlaceholderExample
//
//  Created by Mingo on 2018/8/9.
//  Copyright © 2017年 袁凤鸣. All rights reserved.
//  项目地址：https://github.com/yfming93/FMListPlaceholder
//  作者博客：https://www.yfmingo.cn
//

#import <Foundation/Foundation.h>
#import "UITableView+FMListPlaceholder.h"
#import "UICollectionView+FMListPlaceholder.h"

@interface FMListPlaceholder : NSObject

/// 设置默认的占位图 背景色
@property (nonatomic, strong) UIColor *defaultBackgroundColor;

/// 设置默认的占位图 图片名称
@property (nonatomic, copy) NSString *defaultCoverName;
/// 设置默认的占位图 大小
@property (nonatomic, assign) CGSize defaultCoverSize;
/// 设置默认的占位提示文字 内容
@property (nonatomic, copy) NSString *defaultTips;
/// 设置默认的占位提示文字 颜色
@property (nonatomic, strong) UIColor *defaultTipsTextColor;
/// 设置默认的占位提示文字 字体
@property (nonatomic, strong) UIFont *defaultTipsFont;

/// 设置默认的占位图 CenterY Y轴偏移量
@property (nonatomic, assign) CGFloat coverCenterYOffset;
/// 设置默认的占位图 与 文字之间的距离
@property (nonatomic, assign) CGFloat coverSpaceToTips;

/// 设置默认的 自定义 占位图
@property (nonatomic, strong) UIView *defaultPlaceholder;


/// 初始化全局管家
+ (instancetype)sharedInstance;

/**
 设置各种全局属性 

 @param backgroundColor 设置默认的占位图 背景色
 @param coverName 设置默认的占位图 背景色
 @param tips 设置默认的占位提示文字 内容
 @param tipsTextColor 设置默认的占位提示文字 颜色
 @param tipsFont 设置默认的占位提示文字 字体
 @param coverSize 设置默认的占位图 大小
 @param coverCenterYOffset 设置默认的占位图 CenterY Y轴偏移量
 @param coverSpaceToTips 设置默认的占位图 与 文字之间的距离
 */
+ (void)fm_defaultBackgroundColor:(UIColor *)backgroundColor coverName:(NSString *)coverName tips:(NSString *)tips tipsTextColor:(UIColor *)tipsTextColor tipsFont:(UIFont *)tipsFont coverSize:(CGSize)coverSize coverCenterYOffset:(CGFloat)coverCenterYOffset coverSpaceToTips:(CGFloat)coverSpaceToTips ;
@end

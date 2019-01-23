//
//  UICollectionView+FMEmptyPlaceholder.h
//  FMListPlaceholderExample
//
//  Created by Mingo on 2018/8/9.
//  Copyright © 2017年 袁凤鸣. All rights reserved.
//  项目地址：https://github.com/yfming93/FMListPlaceholder
//  作者博客：https://www.yfmingo.cn
//

#import <UIKit/UIKit.h>
#import "FMListPlaceholder.h"

@interface UICollectionView (FMListPlaceholder)

/** 是否需要空列表占位图 */
@property (nonatomic, assign) BOOL needPlaceholderView;
/** 占位图点击刷新Block */
@property (nonatomic,copy) reloadBlock reloadBlock;

/**
 设置位置大小相关属性
 @param coverCenterYOffset 设置 CenterY 轴偏移量
 @param coverSize 占位图大小
 @param coverSpaceToTips 占位图和文字之间的间距
 */
- (void)fm_coverCenterYOffset:(CGFloat)coverCenterYOffset coverSize:(CGSize)coverSize coverSpaceToTips:(CGFloat)coverSpaceToTips;
/**
 设置颜色字体相关属性
 @param backgroundColor 设置整个占位视图的背景色
 @param tipsTextColor 设置提示文字的背景色
 @param tipsFont 设置提示文字的字体
 */
- (void)fm_backgroundColor:(UIColor *)backgroundColor tipsTextColor:(UIColor *)tipsTextColor tipsFont:(UIFont *)tipsFont;

/**
 设置占位图 和 提示 文字
 @param emptyCoverName 占位图的图片名称
 @param emptyTips 提示文字
 */
- (void)fm_emptyCoverName:(NSString *)emptyCoverName emptyTips:(NSString *)emptyTips;

/// 设置自定义的占位图 [之前设置过的 coverSize 或 coverCenterYOffset 任会生效] 优先级最高
- (void)fm_defaultPlaceholder:(UIView *)defaultPlaceholder;

@end

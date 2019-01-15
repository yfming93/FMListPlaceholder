//
//  UICollectionView+FMEmptyPlaceholder.h
//  FMListPlaceholderDemo
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

- (void)fm_coverCenterYOffset:(CGFloat)coverCenterYOffset coverSize:(CGSize)coverSize coverSpaceToTips:(CGFloat)coverSpaceToTips;
- (void)fm_backgroundColor:(UIColor *)backgroundColor tipsTextColor:(UIColor *)tipsTextColor tipsFont:(UIFont *)tipsFont;
- (void)fm_emptyCoverName:(NSString *)emptyCoverName emptyTips:(NSString *)emptyTips;

@end

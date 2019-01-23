//
//  FMPlaceholderView.h
//  FMListPlaceholderExample
//
//  Created by Mingo on 2018/8/9.
//  Copyright © 2017年 袁凤鸣. All rights reserved.
//  项目地址：https://github.com/yfming93/FMListPlaceholder
//  作者博客：https://www.yfmingo.cn
//

#import <UIKit/UIKit.h>

@interface FMPlaceholderView : UIView

@property (nonatomic, copy) void(^reloadClickBlock)(void);
@property (nonatomic, strong) UIButton *emptyTips;
@property (nonatomic, strong) UIImageView *emptyCover;
@property (nonatomic, assign) CGSize coverSize;
@property (nonatomic, assign) CGFloat coverSpaceToTips;
@property (nonatomic, assign) CGFloat coverCenterYOffset;
/// 设置默认的 自定义 占位图
@property (nonatomic, strong) UIView *defaultPlaceholder;
@end

//
//  FMPlaceholderView.h
//  MobileProject
//
//  Created by Mingo on 2018/8/9.
//  Copyright © 2017年 袁凤鸣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMPlaceholderView : UIView

@property (nonatomic, copy) void(^reloadClickBlock)(void);
@property (nonatomic, strong) UIButton *emptyTips;
@property (nonatomic, strong) UIImageView *emptyCover;
@property (nonatomic, assign) CGSize coverSize;
@property (nonatomic, assign) CGFloat coverSpaceToTips;
@property (nonatomic, assign) CGFloat coverCenterYOffset;
@end

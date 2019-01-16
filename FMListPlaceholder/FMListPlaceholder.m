//
//  FMListPlaceholder.m
//  FMListPlaceholderExample
//
//  Created by Mingo on 2018/8/9.
//  Copyright © 2017年 袁凤鸣. All rights reserved.
//  项目地址：https://github.com/yfming93/FMListPlaceholder
//  作者博客：https://www.yfmingo.cn
//

#import "FMListPlaceholder.h"

static id  _sharedInstance = nil;

@interface FMListPlaceholder()<NSCopying,NSMutableCopying>

@end

@implementation FMListPlaceholder

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [super allocWithZone:zone];
    });
    return _sharedInstance;
}

+(instancetype)sharedInstance {
    return [[self alloc]init];
}

- (id)copyWithZone:(NSZone *)zone {
    return _sharedInstance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _sharedInstance;
}

+ (void)fm_defaultBackgroundColor:(UIColor *)backgroundColor coverName:(NSString *)coverName tips:(NSString *)tips tipsTextColor:(UIColor *)tipsTextColor tipsFont:(UIFont *)tipsFont coverSize:(CGSize)coverSize coverCenterYOffset:(CGFloat)coverCenterYOffset coverSpaceToTips:(CGFloat)coverSpaceToTips  {
    if (backgroundColor) {
        FMListPlaceholder.sharedInstance.defaultBackgroundColor = backgroundColor;
    }
    if (coverName) {
        FMListPlaceholder.sharedInstance.defaultCoverName = coverName;
    }
    if (tips) {
        FMListPlaceholder.sharedInstance.defaultTips = tips;
    }
    if (tipsTextColor) {
        FMListPlaceholder.sharedInstance.defaultTipsTextColor = tipsTextColor;
    }
    if (tipsFont) {
        FMListPlaceholder.sharedInstance.defaultTipsFont = tipsFont;
    }
    if (coverSize.width) {
        FMListPlaceholder.sharedInstance.defaultCoverSize = coverSize;
    }
    FMListPlaceholder.sharedInstance.coverCenterYOffset = coverCenterYOffset;
    FMListPlaceholder.sharedInstance.coverSpaceToTips = coverSpaceToTips;
}


@end


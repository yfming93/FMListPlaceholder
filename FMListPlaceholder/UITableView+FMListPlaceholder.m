//
//  UITableView+FMListPlaceholder.m
//  FMListPlaceholderExample
//
//  Created by Mingo on 2018/8/9.
//  Copyright © 2017年 袁凤鸣. All rights reserved.
//  项目地址：https://github.com/yfming93/FMListPlaceholder
//  作者博客：https://www.yfmingo.cn
//

#import "UITableView+FMListPlaceholder.h"
#import "NSObject+FMSwizzling.h"
#import "FMPlaceholderView.h"

@interface UITableView ()

@property (nonatomic, assign) BOOL isSecondReloadData;
@property (nonatomic, strong) FMPlaceholderView *placeholderView;

@end

@implementation UITableView (FMListPlaceholder)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self fm_methodSwizzlingWithOriginalSelector:@selector(reloadData)
                               bySwizzledSelector:@selector(sure_reloadData)];
    });
}

static void *kFMPlaceholderView = &kFMPlaceholderView;

- (FMPlaceholderView *)placeholderView {
    FMPlaceholderView *placeholderView = objc_getAssociatedObject(self, kFMPlaceholderView);
    if (!placeholderView) {
        placeholderView = [[FMPlaceholderView alloc]initWithFrame:CGRectMake(0, self.tableHeaderView.frame.size.height, self.frame.size.width, self.frame.size.height -self.tableHeaderView.frame.size.height -  self.tableFooterView.frame.size.height)];
        __weak typeof(self) weakSelf = self;
        placeholderView.reloadClickBlock = ^{
            if (weakSelf.reloadBlock) {
                weakSelf.reloadBlock(self);
            }
        };
        objc_setAssociatedObject(self, kFMPlaceholderView, placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return placeholderView;
}

- (void)setPlaceholderView:(UIView *)placeholderView {
    objc_setAssociatedObject(self, @selector(placeholderView), placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)sure_reloadData {
    [self addSubview:self.placeholderView];
    [self sure_reloadData]; //因为转换过方法。这里调用 sure_reloadData 就是调用 reloadData

    if (self.isSecondReloadData) {
        if (self.needPlaceholderView ) {
            self.placeholderView.userInteractionEnabled = NO;
            [self fm_relaodPlaceholderViewHiddenOrShow];
        }
        if ( self.reloadBlock) {
            self.placeholderView.userInteractionEnabled = YES;
            [self fm_relaodPlaceholderViewHiddenOrShow];
        }
    }else{
        self.isSecondReloadData = YES ;
    }
}

- (void)fm_relaodPlaceholderViewHiddenOrShow {
    BOOL isEmpty =  [self isEmptyDataCheck];
    if (isEmpty) {//若为空，加载占位图
        self.placeholderView.hidden = NO;
        
    }else{
        self.placeholderView.hidden = YES;
    }
}

- (BOOL)isEmptyDataCheck {
    BOOL isEmpty = YES;
    id <UITableViewDataSource> dataSource = self.dataSource;
    NSInteger sections = 1;
    if ([dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        sections = [dataSource numberOfSectionsInTableView:self] ;//获取当前TableView组数
    }
    for (NSInteger i = 0; i < sections; i++) {
        NSInteger rows = [dataSource tableView:self numberOfRowsInSection:i];//获取当前TableView各组行数
        if (rows) {
            isEmpty = NO;//若行数存在，不为空
        }
    }
    return isEmpty;
}

- (void)fm_coverCenterYOffset:(CGFloat)coverCenterYOffset coverSize:(CGSize)coverSize coverSpaceToTips:(CGFloat)coverSpaceToTips {
    [self fm_emptyCoverName:nil tips:nil backgroundColor:nil tipsTextColor:nil tipsFont:nil coverCenterYOffset:@(coverCenterYOffset) coverSize:coverSize coverSpaceToTips:@(coverSpaceToTips) ];
}

- (void)fm_backgroundColor:(UIColor *)backgroundColor tipsTextColor:(UIColor *)tipsTextColor tipsFont:(UIFont *)tipsFont {
    [self fm_emptyCoverName:nil tips:nil backgroundColor:backgroundColor tipsTextColor:tipsTextColor tipsFont:tipsFont coverCenterYOffset:nil coverSize:CGSizeZero coverSpaceToTips:nil ];
}

- (void)fm_emptyCoverName:(NSString *)emptyCoverName emptyTips:(NSString *)emptyTips {
    [self fm_emptyCoverName:emptyCoverName tips:emptyTips backgroundColor:nil tipsTextColor:nil tipsFont:nil coverCenterYOffset:nil coverSize:CGSizeZero coverSpaceToTips:nil ];
}

- (void)fm_defaultPlaceholder:(UIView *)defaultPlaceholder {
    if (defaultPlaceholder != nil) {
        self.placeholderView.defaultPlaceholder = defaultPlaceholder;
    }
}

- (void)fm_emptyCoverName:(NSString *)emptyCoverName tips:(NSString *)tips backgroundColor:(UIColor *)backgroundColor tipsTextColor:(UIColor *)tipsTextColor tipsFont:(UIFont *)tipsFont coverCenterYOffset:(NSNumber *)coverCenterYOffset coverSize:(CGSize)coverSize coverSpaceToTips:(NSNumber *)coverSpaceToTips {
    
    
    
    if (emptyCoverName.length) {
        self.placeholderView.emptyCover.image = [UIImage imageNamed:emptyCoverName];
    }
    
    if (tips.length) {
        [self.placeholderView.emptyTips setTitle:tips forState:UIControlStateNormal];
    }
    
    if (backgroundColor) {
        self.placeholderView.backgroundColor = backgroundColor;
    }
    
    if (tipsTextColor) {
        [self.placeholderView.emptyTips setTitleColor:tipsTextColor forState:UIControlStateNormal];
    }
    
    if (tipsFont) {
        [self.placeholderView.emptyTips.titleLabel setFont:tipsFont];;
    }
    
    if (coverSpaceToTips != nil) {
        self.placeholderView.coverSpaceToTips = coverSpaceToTips.floatValue;
    }
    
    if (coverSize.width) {
        self.placeholderView.coverSize = coverSize;
    }
    
    if (coverCenterYOffset != nil) {
        self.placeholderView.coverCenterYOffset = coverCenterYOffset.floatValue;
    }
}

- (BOOL)isSecondReloadData {
    return [objc_getAssociatedObject(self, @selector(isSecondReloadData)) boolValue];
}

- (void)setIsSecondReloadData:(BOOL)isSecondReloadData {
    objc_setAssociatedObject(self, @selector(isSecondReloadData), @(isSecondReloadData), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)needPlaceholderView {
    return [objc_getAssociatedObject(self, @selector(needPlaceholderView)) boolValue];
}

- (void)setNeedPlaceholderView:(BOOL)needPlaceholderView {
    objc_setAssociatedObject(self, @selector(needPlaceholderView), @(needPlaceholderView), OBJC_ASSOCIATION_ASSIGN);
}

- (void (^)(UIScrollView *list))reloadBlock {
    return objc_getAssociatedObject(self, @selector(reloadBlock));
}

- (void)setReloadBlock:(void (^)(UIScrollView *list))reloadBlock {
    objc_setAssociatedObject(self, @selector(reloadBlock), reloadBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end

//
//  FMPlaceholderView.m
//  MobileProject
//
//  Created by Mingo on 2018/8/9.
//  Copyright © 2017年 袁凤鸣. All rights reserved.
//

#import "FMPlaceholderView.h"
#import "FMListPlaceholder.h"



#define kFMScreenW   [UIScreen mainScreen].bounds.size.width       //屏幕宽度
#define kFMScreenH   [UIScreen mainScreen].bounds.size.height      //屏幕高度
#define kFit6(x)       ((kFMScreenW)*((x)/375.0))
#define kTipsH kFit6(22)

@interface FMPlaceholderView ()

@property (nonatomic, strong) NSString *defaultEmptyTips;
@property (nonatomic, strong) NSString *defaultEmptyCoverName;

@end

@implementation FMPlaceholderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        _defaultEmptyTips = @"这里是空的哟";
        _defaultEmptyCoverName = @"fm_emptylist_placeholder";
        _coverSpaceToTips = kFit6(10);
        _coverCenterYOffset = 0;
        if (FMListPlaceholder.sharedInstance.defaultBackgroundColor) {
            self.backgroundColor = FMListPlaceholder.sharedInstance.defaultBackgroundColor;
        }
        
        if (FMListPlaceholder.sharedInstance.defaultTips.length) {
            _defaultEmptyTips = FMListPlaceholder.sharedInstance.defaultTips;
        }
        
        if (FMListPlaceholder.sharedInstance.defaultCoverName.length) {
            _defaultEmptyCoverName = FMListPlaceholder.sharedInstance.defaultCoverName;
        }
        [self createUI];
    }
    return self;
}

-(void)setCoverSize:(CGSize)coverSize {
    _coverSize = coverSize;
    _emptyCover.frame = CGRectMake((self.frame.size.width - coverSize.width)/2,
                                   (self.frame.size.height - coverSize.height) - _coverSpaceToTips - kTipsH,
                                   coverSize.width,
                                   coverSize.height);
    _emptyCover.center = CGPointMake(self.center.x, self.center.y - _coverSpaceToTips/2 - kTipsH/2  + _coverCenterYOffset);
    _emptyTips.frame = CGRectMake(0,
                                  CGRectGetMaxY(self.emptyCover.frame) + _coverSpaceToTips,
                                  self.frame.size.width,
                                  kTipsH);
}

-(void)setCoverCenterYOffset:(CGFloat)coverCenterYOffset {
    _coverCenterYOffset = coverCenterYOffset;
    _emptyCover.center = CGPointMake(self.center.x, self.center.y - _coverSpaceToTips/2 - kTipsH/2  + coverCenterYOffset);
    _emptyTips.frame = CGRectMake(0,
                                  CGRectGetMaxY(self.emptyCover.frame) + _coverSpaceToTips,
                                  self.frame.size.width,
                                  kTipsH);
}

-(void)setcoverSpaceToTips:(CGFloat)coverSpaceToTips {
    _coverSpaceToTips = coverSpaceToTips;
    
    _emptyCover.center = CGPointMake(self.center.x, self.center.y - _coverSpaceToTips/2 - kTipsH/2 );
    _emptyTips.frame = CGRectMake(0,
                                  CGRectGetMaxY(self.emptyCover.frame) + _coverSpaceToTips,
                                  self.frame.size.width,
                                  kTipsH);
}

- (UIImageView *)emptyCover{
    if (!_emptyCover) {
        _emptyCover =[[UIImageView alloc] initWithImage:[UIImage imageNamed:_defaultEmptyCoverName]];
        _emptyCover.contentMode =  UIViewContentModeScaleToFill;
        
        CGSize coverSize = CGSizeMake(self.frame.size.width/3, self.frame.size.width/3);
        if (FMListPlaceholder.sharedInstance.defaultCoverSize.width) {
            coverSize = FMListPlaceholder.sharedInstance.defaultCoverSize;
        }
        
        _emptyCover.frame = CGRectMake((self.frame.size.width - coverSize.width)/2,
                                       (self.frame.size.height - coverSize.height) - _coverSpaceToTips - kTipsH,
                                       coverSize.width,
                                       coverSize.height);
//        _emptyCover.center = self.center;
        CGFloat OffsetY = FMListPlaceholder.sharedInstance.coverCenterYOffset;
        if (self.coverCenterYOffset) {
            OffsetY = self.coverCenterYOffset;
        }
        _emptyCover.center = CGPointMake(self.center.x, self.center.y - _coverSpaceToTips/2 - kTipsH/2 + OffsetY );
        _emptyCover.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [_emptyCover addGestureRecognizer:tap];
    }
    return _emptyCover;
}

- (UIButton *)emptyTips{
    if (!_emptyTips) {
        _emptyTips =[[UIButton alloc] init];
        [_emptyTips setTitle:_defaultEmptyTips forState:UIControlStateNormal];
        _emptyTips.titleLabel.textAlignment = NSTextAlignmentCenter;
        _emptyTips.titleLabel.font = [UIFont systemFontOfSize:kFit6(16)];
        CGFloat coverSpaceToTips = FMListPlaceholder.sharedInstance.coverSpaceToTips;
        if (coverSpaceToTips) {
            _coverSpaceToTips = coverSpaceToTips;
        }
        _emptyTips.frame = CGRectMake(0,
                                      CGRectGetMaxY(self.emptyCover.frame) + _coverSpaceToTips,
                                      self.frame.size.width,
                                      kTipsH);
        [_emptyTips addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
        if (FMListPlaceholder.sharedInstance.defaultTipsTextColor) {
            [_emptyTips setTitleColor:FMListPlaceholder.sharedInstance.defaultTipsTextColor forState:UIControlStateNormal];
        }else{
            [_emptyTips setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
        }
        
        if (FMListPlaceholder.sharedInstance.defaultTipsFont) {
            [_emptyTips.titleLabel setFont:FMListPlaceholder.sharedInstance.defaultTipsFont];
        }
    }
    return _emptyTips;
}


- (void)tapAction {
    if (self.reloadClickBlock) {
        
        self.reloadClickBlock();
        
        [UIView animateWithDuration:1.0 animations:^{
            self.emptyCover.alpha = 0.5;
            self.emptyTips.alpha = 0.5;
            [UIView animateWithDuration:0.5 animations:^{
                self.emptyCover.alpha = 1.0;
                self.emptyTips.alpha = 1.0;
            }];
        }];
    }
}


- (void)createUI {
    [self addSubview:self.emptyCover];
    [self addSubview:self.emptyTips];
}

- (void)reloadClick:(UIButton*)button {
    if (self.reloadClickBlock) {
        self.reloadClickBlock();
    }
}




@end

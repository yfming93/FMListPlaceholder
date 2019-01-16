//
//  FMBaseViewController.h
//  FMListPlaceholderExample
//
//  Created by mingo on 2019/1/15.
//  Copyright © 2019年 袁凤鸣. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenW            [UIScreen mainScreen].bounds.size.width       //屏幕宽度
#define kScreenH            [UIScreen mainScreen].bounds.size.height      //屏幕高度
#define kRandomColor  [UIColor colorWithRed:(arc4random_uniform(256))/255.0 green:arc4random_uniform(256)/255.0 blue:(arc4random_uniform(256))/255.0 alpha:1.0]

@interface FMBaseViewController : UIViewController

@end

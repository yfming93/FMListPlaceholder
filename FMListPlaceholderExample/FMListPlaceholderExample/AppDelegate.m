//
//  AppDelegate.m
//  FMListPlaceholderExample
//
//  Created by mingo on 2019/1/16.
//  Copyright © 2019年 袁凤鸣. All rights reserved.
//

#import "AppDelegate.h"
#import "FMListPlaceholderExample.h"
#import <FMListPlaceholder.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /// 设置全局默认属性
    //    [FMListPlaceholder fm_defaultBackgroundColor:UIColor.whiteColor coverName:@"xxx" tips:@"Sorroy,nil here!" tipsTextColor:UIColor.grayColor tipsFont:[UIFont systemFontOfSize:16] coverSize:CGSizeZero coverCenterYOffset:-30 coverSpaceToTips:10];
    
//    UIView *vv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90, 120)];
//    vv.backgroundColor = UIColor.blueColor;
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 90, 90, 30)];
//    [vv addSubview:btn];
//    [btn setTitle:@"哈哈哈" forState:0];
//    [vv addSubview:btn];
//    /// 设置全局默认的 自定义 占位图
//    FMListPlaceholder.sharedInstance.defaultPlaceholder = vv;
    
    /// 更多用法见 FMTableViewPlaceholder 文件
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[FMListPlaceholderExample alloc] init]];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = UIColor.whiteColor;

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

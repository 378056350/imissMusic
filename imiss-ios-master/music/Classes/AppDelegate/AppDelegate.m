//
//  AppDelegate.m
//  imiss
//
//  Created by 郑业强 on 2018/8/13.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+UMengShare.h"
#import "AppDelegate+ScreenShot.h"

#pragma mark - 声明
@interface AppDelegate ()

@end

#pragma mark - 实现
@implementation AppDelegate

// 程序入口
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 根控制器
    [self makeRootController];
    // 友盟分享
    [self configUSharePlatforms];
    // 截屏事件
    [self screenshotNotification];
    
    return YES;
}
// 根控制器
- (void)makeRootController {
    self.window = [[UIWindow alloc] initWithFrame:SCREEN_BOUNDS];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window setRootViewController:[[BaseTabBarController alloc] init]];
    [self.window makeKeyAndVisible];
}


// 系统回调
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    // 友盟分享
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}


@end


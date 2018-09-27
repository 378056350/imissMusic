//
//  BaseTabBarController.m
//  iOS
//
//  Created by RY on 2018/3/19.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseTabBar.h"

#pragma mark - 声明
@interface BaseTabBarController ()

@end

#pragma mark - 实现
@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeController *home = [[HomeController alloc] init];
    [self addChildViewController:home title:@"首页" image:@"cm4_btm_icn_discovery" selImage:@"cm4_btm_icn_discovery_prs"];
    SheetController *sheet = [[SheetController alloc] init];
    [self addChildViewController:sheet title:@"歌单" image:@"cm4_btm_icn_music_new" selImage:@"cm4_btm_icn_music_new_prs"];
    MineController *mine = [[MineController alloc] init];
    [self addChildViewController:mine title:@"我的" image:@"cm4_btm_icn_music_new" selImage:@"cm4_btm_icn_music_new_prs"];
    
}

- (void)hideTabbar:(BOOL)hidden {
    [UIView animateWithDuration:.3f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.tabBar.top = SCREEN_HEIGHT - (hidden == YES ? 0 : TabbarHeight);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)addChildViewController:(BaseViewController *)childVc title:(NSString *)title image:(NSString *)image selImage:(NSString *)selImage {
    static NSInteger index = 0;
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.tag = index;
    childVc.navTitle = title;
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColor_Text_Black colorWithAlphaComponent:0.5], NSForegroundColorAttributeName, [UIFont systemFontOfSize:AdjustFont(10)],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MainColor, NSForegroundColorAttributeName, [UIFont systemFontOfSize:AdjustFont(10)],NSFontAttributeName,nil] forState:UIControlStateSelected];
    index++;
    // 让子控制器包装一个导航控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    for (UIView *view in self.tabBar.subviews) {
        NSLog(@"%@",self.tabBar.subviews);
        [view removeFromSuperview];
    }
    
    // 自定义TabBar
    __weak typeof(self) weak = self;
    BaseTabBar *tabBar = [[BaseTabBar alloc] init];
    [tabBar setClick:^(NSInteger index) {
        [weak setSelectedIndex:index];
    }];
    [self setValue:tabBar forKey:@"tabBar"];
}


@end

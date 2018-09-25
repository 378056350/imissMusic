//
//  BaseNavigationController.h
//  iOS
//
//  Created by RY on 2018/3/19.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController

#pragma mark - 初始化
+ (instancetype)initWithRootViewController:(UIViewController *)vc;

@end

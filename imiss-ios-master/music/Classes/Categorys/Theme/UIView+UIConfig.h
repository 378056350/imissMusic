//
//  UIView+UIConfig.h
//  imiss
//
//  Created by 郑业强 on 2018/9/16.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeConst.h"

#pragma mark - 声明
@interface UIView (UIConfig)

// 主题数据
@property (nonatomic, copy) NSDictionary *themeMap;
// 开启夜间模式: 默认开启
@property (nonatomic, assign, getter=isAllowNight) BOOL allowNight;

// 主题改变
- (void)themeChanged;
// 当前主题
- (BOOL)isNight;

@end



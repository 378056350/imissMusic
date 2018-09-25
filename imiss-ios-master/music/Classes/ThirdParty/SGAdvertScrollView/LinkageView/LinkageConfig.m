//
//  LinkageConfig.m
//  ZhongLv
//
//  Created by MAC on 2018/4/27.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "LinkageConfig.h"

@implementation LinkageConfig

/// 项目默认设置
+ (instancetype)initWithDefaultStyle {
    LinkageConfig *config = [[LinkageConfig alloc] init];
    config.titleFrame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    config.contentFrame = CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT - NavigationBarHeight - 50 - countcoordinatesX(100) - SafeAreaBottomHeight);
    config.titleSelectedFont = [UIFont systemFontOfSize:AdjustFont(14) weight:UIFontWeightBold];
    config.titleFont = [UIFont systemFontOfSize:AdjustFont(14) weight:UIFontWeightLight];
    config.titleSelectedColor = kColor_White;
    config.titleColor = [kColor_White colorWithAlphaComponent:0.8];
    config.indicatorColor = MainColor;
    config.indicatorFixedWidth = 0;
    config.indicatorAdditionalWidth = 0;
    config.bottomSeparatorColor = kColor_BG;
    return config;
}

@end

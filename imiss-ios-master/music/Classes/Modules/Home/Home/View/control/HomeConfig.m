//
//  HomeConfig.m
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeConfig.h"

@implementation HomeConfig

+ (HomeConfig *)shareConfig {
    HomeConfig *config = [[HomeConfig alloc] init];
    return config;
}

@end

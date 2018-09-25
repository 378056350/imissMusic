//
//  TimeTool.m
//  imiss
//
//  Created by MAC on 2018/8/14.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "TimeTool.h"

@implementation TimeTool

+ (BOOL)isNight {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH"];
    NSString *str = [formatter stringFromDate:[NSDate date]];
    int time = [str intValue];
    if (time >= 18 || time <= 06) {
        return YES;
    }
    else{
        return NO;
    }
}

+ (UIImage *)imageNamed:(NSString *)lightImg night:(NSString *)nightImg {
    return [UIImage imageNamed:[TimeTool isNight] ? nightImg : lightImg];
}

@end

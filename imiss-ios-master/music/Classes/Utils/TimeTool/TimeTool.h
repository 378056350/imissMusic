//
//  TimeTool.h
//  imiss
//
//  Created by MAC on 2018/8/14.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeTool : NSObject

+ (BOOL)isNight;
+ (UIImage *)imageNamed:(NSString *)lightImg night:(NSString *)nightImg;

@end

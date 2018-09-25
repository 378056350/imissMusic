//
//  HomeConfig.h
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeConfig : NSObject

@property (nonatomic, strong) NSArray<NSString *> *titles;

+ (HomeConfig *)shareConfig;

@end

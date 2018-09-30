//
//  HomeSongModel.m
//  music
//
//  Created by 郑业强 on 2018/10/1.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomePupularModel.h"

@implementation HomeSongModel
+ (void)load {
    [HomeSongModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID": @"id"
                 };
    }];
}
@end


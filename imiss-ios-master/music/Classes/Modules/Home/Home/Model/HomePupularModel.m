//
//  HomeSongModel.m
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomePupularModel.h"


@implementation HomePupularListModel
+ (void)load {
    [HomePupularListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"song": @"HomeSongModel"
                 };
    }];
}
@end

//
//  SongModel.m
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "PupularModel.h"


@implementation HomePupularListModel
+ (void)load {
    [HomePupularListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"song": @"SongModel"
                 };
    }];
}
@end

//
//  FakeData.m
//  music
//
//  Created by 郑业强 on 2018/10/2.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "FakeData.h"

@implementation FakeData

+ (NSDictionary *)homeData {
    NSArray *titles = @[@"Shelton Cooper", @"Football team", @"Beauty girl", @"The Big Bang"];
    NSArray *authors = @[@"Tobey Maguire", @"James", @"Liu Dehua", @"Shelton Cooper"];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i=0; i<titles.count; i++) {
        NSString *small_img = [NSString stringWithFormat:@"small_img%d.jpeg", i + 1];
        NSString *big_img = [NSString stringWithFormat:@"big_img%d.jpeg", i + 1];
        [arr addObject:@{
                         @"name": titles[i],
                         @"author": authors[i],
                         @"big_img": big_img,
                         @"small_img": small_img,
                         @"detail": @"这个是详细的介绍, 这个是详细的介绍, 这个是详细的介绍, 这个是详细的介绍, 这个是详细的介绍, 这个是详细的介绍, 这个是详细的介绍, 这个是详细的介绍, 这个是详细的介绍, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚, 啦啦啦啦德玛西亚",
                         @"id": [@(i) description],
                         @"introduction": @"这个是介绍",
                         @"likeNumber": [@(random() % 300000) description],
                         @"shareNumber": [@(random() % 300000) description],
                         @"listenNumber": [@(random() % 300000) description],
                         @"name": @"The Big Bang",
                         }];
    }
    
    return @{
             @"popular_count": @"4",
             @"song": arr
             };
}

+ (NSArray *)sheetData {
    return @[
             @{
                 @"id": @"1",
                 @"img": @"small_img1.jpeg",
                 @"name": @"哈哈哈1"
                 },
             @{
                 @"id": @"1",
                 @"img": @"small_img2.jpeg",
                 @"name": @"哈哈哈2"
                 }
             ];
}

+ (NSArray *)songWithSheet {
    NSArray *titles = @[@"Shelton Cooper", @"Football team", @"Beauty girl", @"The Big Bang"];
    NSArray *authors = @[@"Tobey Maguire", @"James", @"Liu Dehua", @"Shelton Cooper"];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i=0; i<titles.count; i++) {
        NSString *small_img = [NSString stringWithFormat:@"small_img%d.jpeg", i + 1];
        [arr addObject:@{
                         @"name": titles[i],
                         @"author": authors[i],
                         @"big_img": @"music/2c48f8b60d.png",
                         @"detail": @"这个是详情这个是详情这个是详情这个是详情这个是详情这个是详情这个是详情这个是详情",
                         @"id": @"1",
                         @"introduction": @"这个是介绍",
                         @"likeNumber": [@(random() % 300000) description],
                         @"listenNumber": [@(random() % 300000) description],
                         @"shareNumber": [@(random() % 300000) description],
                         @"small_img": small_img
                         }];
    }
    return arr;
}

+ (NSDictionary *)resourceData {
    return @{
             @"id": @"1",
             @"lrc": @"后来.lrc",
             @"mp3": @"后来.mp3",
             @"song_id": @"1"
             };
}

@end

//
//  NSString+API.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/21.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>


#define KHost @"http://127.0.0.1:8080"
#define KStatic(str) [NSString stringWithFormat:@"http://127.0.0.1:8080/media/%@", str]
#define Request(A) [NSString create_request:A]


// 受欢迎歌曲
#define CreatePopularRequest Request(@"/music/getPopularRequest.action")
// 资源
#define CreateResourceRequest Request(@"/music/getResourceRequest.action")
// 歌单列表
#define CreateSheetRequest Request(@"/music/getSheetRequest.action")
// 歌单列表
#define CreateSongWithSheetRequest Request(@"/music/getSongsWithSheetRequest.action")


@interface NSString (API)

/// host + 请求
+ (NSString *)create_request:(NSString *)string;

@end

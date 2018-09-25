//
//  NSString+API.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/21.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (API)

/// 获取验证码
+ (NSString *)create_register_code_request;
/// 验证验证码
+ (NSString *)ver_register_code_request;
/// 注册
+ (NSString *)create_user_request;
/// 登录
+ (NSString *)user_login_request;
/// 创建歌曲
+ (NSString *)create_song_request;


/// 首页
+ (NSString *)get_home_request;
/// 歌曲推荐(每日推荐)
+ (NSString *)get_recommend_song_request;
/// 歌单列表
+ (NSString *)get_sheet_list_request;
/// 歌单
+ (NSString *)get_sheet_request;

/// 我的页面
+ (NSString *)get_mine_request;


/// 创建我的歌单
+ (NSString *)create_mysheet_request;
/// 删除我的歌单
+ (NSString *)delete_mysheet_request;
/// 获取我的歌单
+ (NSString *)select_mysheet_request;
/// 更新我的歌单
+ (NSString *)update_mysheet_request;
/// 添加歌曲到我的歌单
+ (NSString *)insert_mysheet_song_request;
/// 删除歌曲到我的歌单
+ (NSString *)delete_mysheet_song_request;


/// 排行榜
+ (NSString *)get_ranking_list_request;

/// 获取资源
+ (NSString *)get_resources_request;

@end

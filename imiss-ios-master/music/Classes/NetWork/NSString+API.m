//
//  NSString+API.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/21.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "NSString+API.h"


// 获取验证码
#define CreateRegisterCodeRequest @"/user/createRegisterCode.action"
// 验证验证码
#define VerificationRegisterCodeRequest @"/user/verificationRegisterCode.action"
// 注册
#define CreateUserRequest @"/user/createUserRequest.action"
// 登录
#define UserLoginRequest @"/user/userLogin.action"
// 创建歌曲
#define CreateSongRequest @"/music/createSongRequest.action"

// 首页
#define GetHomeRequest    @"/music/getHomeRequest.action"
// 歌曲推荐(每日推荐)
#define GetRecommendSongRequest    @"/music/getRecommendSongRequest.action"
// 歌单列表
#define GetSheetListRequest    @"/music/getSheetListRequest.action"
// 歌单
#define GetSheetRequest    @"/music/getSheetRequest.action"


// 我的
#define GetMineRequest    @"/music/getMineRequest.action"


// 创建我的歌单
#define CreateMySheetRequest    @"/music/createMySheetRequest.action"
// 删除我的歌单
#define DeleteMySheetRequest    @"/music/deleteMySheetRequest.action"
// 查看我的歌单
#define SelectMySheetRequest    @"/music/selectSheetRequest.action"
// 编辑我的歌单
#define UpdateMySheetRequest    @"/music/updateSheetRequest.action"
// 添加歌曲到我的歌单
#define InsertMySheetSongRequest    @"/music/insertMySheetSongRequest.action"
// 删除歌曲到我的歌单
#define DeleteMySheetSongRequest    @"/music/deleteMySheetSongRequest.action"

// 排行榜
#define GetRankingListRequest       @"/music/getRankListRequest.action"
// 资源
#define GetResourcesRequest         @"/music/getResourceRequest.action"


@implementation NSString (API)



/// 获取验证码
+ (NSString *)create_register_code_request {
    return [NSString stringWithFormat:@"%@%@", KHost, CreateRegisterCodeRequest];
}
/// 验证验证码
+ (NSString *)ver_register_code_request {
    return [NSString stringWithFormat:@"%@%@", KHost, VerificationRegisterCodeRequest];
}

/// 注册
+ (NSString *)create_user_request {
    return [NSString stringWithFormat:@"%@%@", KHost, CreateUserRequest];
}
/// 登录
+ (NSString *)user_login_request {
    return [NSString stringWithFormat:@"%@%@", KHost, UserLoginRequest];
}
/// 创建歌曲
+ (NSString *)create_song_request {
    return [NSString stringWithFormat:@"%@%@", KHost, CreateSongRequest];
}


/// 首页
+ (NSString *)get_home_request {
    return [NSString stringWithFormat:@"%@%@", KHost, GetHomeRequest];
}
/// 歌曲推荐(每日推荐)
+ (NSString *)get_recommend_song_request {
    return [NSString stringWithFormat:@"%@%@", KHost, GetRecommendSongRequest];
}
/// 歌单列表
+ (NSString *)get_sheet_list_request {
    return [NSString stringWithFormat:@"%@%@", KHost, GetSheetListRequest];
}
/// 歌单
+ (NSString *)get_sheet_request {
    return [NSString stringWithFormat:@"%@%@", KHost, GetSheetRequest];
}



/// 我的页面
+ (NSString *)get_mine_request {
    return [NSString stringWithFormat:@"%@%@", KHost, GetMineRequest];
}


/// 创建我的歌单
+ (NSString *)create_mysheet_request {
    return [NSString stringWithFormat:@"%@%@", KHost, CreateMySheetRequest];
}
/// 删除我的歌单
+ (NSString *)delete_mysheet_request {
    return [NSString stringWithFormat:@"%@%@", KHost, DeleteMySheetRequest];
}
/// 获取我的歌单
+ (NSString *)select_mysheet_request {
    return [NSString stringWithFormat:@"%@%@", KHost, SelectMySheetRequest];
}
/// 更新我的歌单
+ (NSString *)update_mysheet_request {
    return [NSString stringWithFormat:@"%@%@", KHost, UpdateMySheetRequest];
}
/// 添加歌曲到我的歌单
+ (NSString *)insert_mysheet_song_request {
    return [NSString stringWithFormat:@"%@%@", KHost, InsertMySheetSongRequest];
}
/// 删除歌曲到我的歌单
+ (NSString *)delete_mysheet_song_request {
    return [NSString stringWithFormat:@"%@%@", KHost, DeleteMySheetSongRequest];
}

/// 排行榜
+ (NSString *)get_ranking_list_request {
    return [NSString stringWithFormat:@"%@%@", KHost, GetRankingListRequest];
}


/// 获取资源
+ (NSString *)get_resources_request {
    return [NSString stringWithFormat:@"%@%@", KHost, GetResourcesRequest];
}



@end

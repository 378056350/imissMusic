//
//  UserModel.h
//  imiss
//
//  Created by MAC on 2018/8/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Realm/Realm.h>

RLM_ARRAY_TYPE(UserModel);
@interface UserModel : RLMObject

@property BOOL lockLyrics;      // 锁屏歌词
@property BOOL nightMode;       // 夜间模式
@property BOOL screenShare;     // 截屏后分享

@end


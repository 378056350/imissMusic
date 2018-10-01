//
//  RLMRealm+Extension.h
//  imiss
//
//  Created by MAC on 2018/8/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Realm/Realm.h>
#import "UserModel.h"

//#pragma mark - const
//// 登录
//UIKIT_EXTERN NSString *const RealmLogin;
//// 退出
//UIKIT_EXTERN NSString *const RealmLogOut;

#pragma mark - 声明
@interface RLMRealm (Extension)

// GET
+ (RLMRealm *)getRealm;
// 读取数据
+ (RLMResults *)loadModel:(Class )cls;
// 保存数据
+ (void)saveModel:(__kindof RLMObject *)model;
// 删除model
+ (void)removeModel:(Class)cls;

//================================= 个人信息 =================================//
// 保存个人信息
+ (void)saveUserInfo:(UserModel *)model;
// 读取个人信息
+ (UserModel *)loadUserInfo;
// 删除个人信息
+ (void)removeUserInfo;

@end

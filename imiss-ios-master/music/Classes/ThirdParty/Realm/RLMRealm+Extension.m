//
//  RLMRealm+Extension.m
//  imiss
//
//  Created by MAC on 2018/8/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "RLMRealm+Extension.h"

//#pragma mark - const
//NSString *const RealmLogin = @"RealmLogin";
//NSString *const RealmLogOut = @"RealmLogOut";

#pragma mark - 实现
@implementation RLMRealm (Extension)

static RLMRealm *_realm;

//==============================================================================
//                                   Base
//==============================================================================
// 初始化
+ (void)load {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dbPath = [docPath stringByAppendingPathComponent:@"db.realm"];
    RLMRealm *realm = [RLMRealm realmWithURL:[NSURL fileURLWithPath:dbPath]];
    _realm = realm;
    
    // 初始化数据
    UserModel *user = [self loadUserInfo];
    if (!user) {
        [self saveUserInfo:({
            UserModel *model = [[UserModel alloc] init];
            model.lockLyrics = NO;
            model.nightMode = NO;
            model.screenShare = NO;
            model;
        })];
    }
}
// 保存数据
+ (void)saveModel:(__kindof RLMObject *)model {
    [_realm beginWriteTransaction];
    [_realm addObject:model];
    [_realm commitWriteTransaction];
}
// 读取数据
+ (RLMResults *)loadModel:(Class)cls {
    RLMResults *results = [cls allObjectsInRealm:_realm];
    if (results.isOptional == YES) {
        return nil;
    }
    else {
        return results;
    }
}
// 删除model
+ (void)removeModel:(Class)cls {
    RLMResults *results = [cls allObjectsInRealm:_realm];
    [_realm beginWriteTransaction];
    for (RLMObject *model in results) {
        [_realm deleteObject:model];
    }
    [_realm commitWriteTransaction];
}

// GET
+ (RLMRealm *)getRealm {
    return _realm;
}


//==============================================================================
//                                  个人信息
//==============================================================================
// 保存个人信息
+ (void)saveUserInfo:(UserModel *)model {
    [_realm beginWriteTransaction];
    [_realm addObject:model];
    [_realm commitWriteTransaction];
}
// 读取数据
+ (UserModel *)loadUserInfo {
    RLMResults *results = [self loadModel:[UserModel class]];
    if (results.isOptional == YES) {
        return nil;
    }
    else {
        return [results lastObject];
    }
}
// 删除所有数据
+ (void)removeUserInfo {
    RLMResults *results = [UserModel allObjectsInRealm:_realm];
    [_realm beginWriteTransaction];
    for (UserModel *model in results) {
        [_realm deleteObject:model];
    }
    [_realm commitWriteTransaction];
}


@end

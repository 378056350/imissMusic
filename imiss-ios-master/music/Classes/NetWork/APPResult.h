//
//  APPResult.h
//  coding-ios-master
//
//  Created by MAC on 2018/5/24.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - typeof
typedef NS_ENUM(NSInteger, ServiceType) {
    ServiceTypeNetwork = 0,       // 请求
    ServiceTypeOffline = 1,       // 离线
};

typedef NS_ENUM(NSInteger, ServiceStatus) {
    ServiceStatusSuccess = 200,       // 成功
    ServiceStatusFail = 1001,         // 失败
};

@interface APPResult : NSObject

@property (nonatomic, assign) ServiceType result;   // 错误码
@property (nonatomic, assign) ServiceStatus status; // 样式
@property (nonatomic, strong) id data;              // 数据
@property (nonatomic, strong) id message;           // 描述

@end

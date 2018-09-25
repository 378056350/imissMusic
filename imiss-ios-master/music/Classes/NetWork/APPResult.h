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
    ServiceTypeSuccess = 200,       // 成功
    ServiceTypeFail = 1001,         // 失败
};

typedef NS_ENUM(NSInteger, ServiceStatus) {
    ServiceStatusNetwork = 0,       // 请求
    ServiceStatusOffline = 1,       // 离线
};

@interface APPResult : NSObject

@property (nonatomic, assign) ServiceType result;   // 错误码
@property (nonatomic, assign) ServiceStatus status; // 样式
@property (nonatomic, strong) id data;              // 数据
@property (nonatomic, strong) id message;           // 描述

@end

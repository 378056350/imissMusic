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
@implementation NSString (API)

/// host + 请求
+ (NSString *)create_request:(NSString *)string {
    return [NSString stringWithFormat:@"%@%@", KHost, string];
}

@end

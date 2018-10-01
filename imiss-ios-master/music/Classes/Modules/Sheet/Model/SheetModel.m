//
//  SheetModel.m
//  music
//
//  Created by 郑业强 on 2018/10/1.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SheetModel.h"

@implementation SheetModel

+ (void)load {
    [SheetModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID": @"id"
                 };
    }];
}

@end

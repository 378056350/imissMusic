//
//  SheetModel.m
//  imiss
//
//  Created by MAC on 2018/9/3.
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

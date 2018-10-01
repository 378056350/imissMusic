//
//  FakeData.h
//  music
//
//  Created by 郑业强 on 2018/10/2.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FakeData : NSObject

+ (NSDictionary *)homeData;
+ (NSArray *)sheetData;
+ (NSArray *)songWithSheet;
+ (NSDictionary *)resourceData;

@end

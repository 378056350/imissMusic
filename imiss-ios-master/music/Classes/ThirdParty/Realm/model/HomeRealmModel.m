//
//  HomeRealmModel.m
//  imiss
//
//  Created by 郑业强 on 2018/9/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeRealmModel.h"

@implementation HomeCarouselRealmModel

@end

@implementation HomeRealmModel

- (NSDictionary *)classInArray {
    return @{
                @"carousel": @"HomeCarouselRealmModel",
                @"sheet": @"SheetRealmModel",
                @"song": @"SongRealmModel"
             };
}

@end

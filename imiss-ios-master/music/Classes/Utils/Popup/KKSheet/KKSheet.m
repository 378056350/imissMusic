//
//  KKSheet.m
//  SanYangWetland
//
//  Created by MAC on 2018/8/21.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "KKSheet.h"

#pragma mark - 声明
@interface KKSheet ()

@end

#pragma mark - 实现
@implementation KKSheet

+ (instancetype)init {
    KKSheet *view = [super init];
    [view setStyle:KKPopupStyleBottom];
    [view contentv];
    return view;
}
- (KKSheetContent *)contentv {
    if (!_contentv) {
        _contentv = [KKSheetContent loadFirstNib:({
            CGFloat height = countcoordinatesX((40 + 50 * 3)) + SafeAreaBottomHeight;
            CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, height);
        })];
        [self addSubview:_contentv];
        [self setContent:_contentv];
    }
    return _contentv;
}


@end


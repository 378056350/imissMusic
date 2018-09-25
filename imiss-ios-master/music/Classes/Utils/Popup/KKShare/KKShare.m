//
//  KKShare.m
//  SanYangWetland
//
//  Created by MAC on 2018/8/21.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "KKShare.h"

#pragma mark - 声明
@interface KKShare ()

@end

#pragma mark - 实现
@implementation KKShare

+ (instancetype)init {
    KKShare *view = [super init];
    [view setStyle:KKPopupStyleBottom];
    [view contentv];
    return view;
}
- (KKShareContent *)contentv {
    if (!_contentv) {
        __weak typeof(self) weak = self;
        _contentv = [KKShareContent loadFirstNib:({
            CGFloat height = 140;
            CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, height);
        })];
        [_contentv.cancleBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weak hide];
        }];
        [self addSubview:_contentv];
        [self setContent:_contentv];
    }
    return _contentv;
}

@end



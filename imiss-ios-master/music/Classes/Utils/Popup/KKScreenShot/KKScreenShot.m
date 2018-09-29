//
//  KKScreenShot.m
//  music
//
//  Created by zhongke on 2018/9/29.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKScreenShot.h"

#pragma mark - 声明
@interface KKScreenShot ()

@end

#pragma mark - 实现
@implementation KKScreenShot

+ (instancetype)init {
    KKScreenShot *view = [super init];
    [view setStyle:KKPopupStylePopup];
    [view contentv];
    return view;
}
- (KKScreenShotContent *)contentv {
    if (!_contentv) {
        __weak typeof(self) weak = self;
        _contentv = [KKScreenShotContent loadFirstNib:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH - countcoordinatesX(100), 0)];
        [_contentv.closeBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weak hide];
        }];
        [self addSubview:_contentv];
        [self setContent:_contentv];
    }
    return _contentv;
}

@end

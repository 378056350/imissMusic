//
//  AppProgressView.m
//  music
//
//  Created by zhongke on 2018/9/29.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "AppProgressView.h"

#pragma mark - 声明
@interface AppProgressView()

@end

#pragma mark - 实现
@implementation AppProgressView

+ (instancetype)init {
    AppProgressView *view = [[AppProgressView alloc] init];
    [view setBackgroundColor:[UIColor redColor]];
    return view;
}
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    NSTimeInterval time = ABS(self.width - progress * SCREEN_WIDTH) / 300.f;
    [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.width = SCREEN_WIDTH * progress;
    } completion:^(BOOL finished) {
        
    }];
}


@end

//
//  MusicFlag.m
//  imiss
//
//  Created by 郑业强 on 2018/9/13.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicFlag.h"

#pragma mark - 声明
@interface MusicFlag()

@property (weak, nonatomic) IBOutlet UIButton *play;
@property (weak, nonatomic) IBOutlet UIView *line;

@end

#pragma mark - 实现
@implementation MusicFlag

// 初始化
- (void)initUI {
    [self.time setFont:[UIFont systemFontOfSize:AdjustFont(12)]];
    [self.time setTextColor:[[UIColor whiteColor] colorWithAlphaComponent:0.3]];
    [self.line setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.1]];
    [self.play.imageView setContentMode:UIViewContentModeScaleAspectFit];
}

// 播放
- (IBAction)playClick:(UIButton *)sender {
    if (_click) {
        _click();
    }
}

// 透明度
- (void)setAlpha:(CGFloat)alpha {
    [UIView animateWithDuration:.3f animations:^{
        [super setAlpha:alpha];
    }];
}

// 只允许触摸播放按钮
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isKindOfClass:[UIButton class]]) {
        return view;
    }
    return nil;
}

@end

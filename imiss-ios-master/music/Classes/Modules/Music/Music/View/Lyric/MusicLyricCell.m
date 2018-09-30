//
//  MusicLyricCell.m
//  imiss
//
//  Created by 郑业强 on 2018/9/2.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicLyricCell.h"

#pragma mark - 声明
@interface MusicLyricCell() 

@property (nonatomic, strong) UILabel *nameLab;

@end

#pragma mark - 实现
@implementation MusicLyricCell

- (void)initUI {
    _choose = NO;
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    [self setBackgroundColor:[UIColor clearColor]];
    [self nameLab];
    [self choose:NO alpha:0 animation:NO];
}

#pragma mark - set
- (void)setLrc:(NSString *)lrc {
    _lrc = lrc;
    _nameLab.text = lrc;
}

#pragma mark - 动画
// 是否选中
- (void)choose:(BOOL)choose alpha:(CGFloat)alpha animation:(BOOL)animation {
    NSTimeInterval time = animation == YES ? 0.3f : 0.0;
    if (choose == YES) {
        alpha = choose == NO ? 0 : alpha;
    }
    else {
        alpha = 0.3;
    }
    if (self.nameLab.alpha == alpha) {
        return;
    }
    [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.nameLab setAlpha:alpha];
        if (alpha == 0.5) {
            self.nameLab.alpha = alpha;
        }
        else {
            self.nameLab.alpha = alpha;
        }
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - get
- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, countcoordinatesX(30))];
        _nameLab.font = [UIFont systemFontOfSize:AdjustFont(12)];
        _nameLab.textColor = kColor_White;
        _nameLab.textAlignment = NSTextAlignmentCenter;
        _nameLab.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_nameLab];
    }
    return _nameLab;
}

@end

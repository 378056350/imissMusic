//
//  MusicCD.m
//  music
//
//  Created by 郑业强 on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicCD.h"

#pragma mark - 声明
@interface MusicCD()

@end

#pragma mark - 实现
@implementation MusicCD

- (void)initUI {
    [self icon];
    [self nameLab];
    [self detailLab];
    [self setBackgroundColor:kColor_BG];
}

#pragma mark - set
- (void)setModel:(HomeSongModel *)model {
    _model = model;
    [_icon sd_setImageWithURL:[NSURL URLWithString:KStatic(model.big_img)]];
    [_nameLab setText:model.name];
    [_detailLab setText:model.author];
}

#pragma mark - get
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:({
            CGFloat left = countcoordinatesX(30);
            CGFloat top = countcoordinatesX(25);
            CGFloat width = SCREEN_WIDTH - left * 2;
            CGFloat height = width;
            CGRectMake(left, top, width, height);
        })];
        [_icon shadowWithColor:[kColor_Text_Gary colorWithAlphaComponent:0.5] offset:CGSizeMake(0, 5) opacity:1 radius:5];
        _icon.backgroundColor = [UIColor redColor];
        [self addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.icon.frame) + countcoordinatesX(10), SCREEN_WIDTH, 30)];
        _nameLab.font = MathFont(18);
        _nameLab.text = @"Take It Back";
        _nameLab.textColor = kColor_Text_Black;
        _nameLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
- (UILabel *)detailLab {
    if (!_detailLab) {
        _detailLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.nameLab.frame), SCREEN_WIDTH, 25)];
        _detailLab.font = MathFont(14);
        _detailLab.text = @"Figgy";
        _detailLab.textColor = kColor_Text_Gary;
        _detailLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_detailLab];
    }
    return _detailLab;
}

@end

//
//  BaseItem.m
//  imiss
//
//  Created by 郑业强 on 2018/8/23.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseItem.h"

#pragma mark - 声明
@interface BaseItem()

@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UIImageView *iconImg;

@end

#pragma mark - 实现
@implementation BaseItem

- (void)initUI {
    [self setUserInteractionEnabled:YES];
    [self nameLab];
    [self iconImg];
    
}

#pragma mark - 设置
// 姓名
- (void)setName:(NSString *)name {
    _name = name;
    self.nameLab.text = name;
}
// 图片
- (void)setIcon:(NSString *)icon {
    _icon = icon;
    self.iconImg.image = [UIImage imageNamed:icon];
}
// 样式
- (void)setStatus:(BaseItemStatus)status {
    _status = status;
    CGFloat padding = countcoordinatesX(5);
    CGFloat height = 44;
    CGFloat nameW = [self.nameLab.text sizeWithMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) font:self.nameLab.font].width;
    CGFloat iconW = 15;
    self.height = height;
    // 文字在左
    if (status == BaseItemStatusTextLeft) {
        self.nameLab.frame = CGRectMake(padding, 0, nameW, height);
        self.nameLab.textAlignment = NSTextAlignmentLeft;
        self.iconImg.frame = CGRectMake(CGRectGetMaxX(self.nameLab.frame) + padding, 0, iconW, height);
        self.width = self.nameLab.width + self.iconImg.width + padding * 3;
    }
    // 文字在右
    else if (status == BaseItemStatusTextRight) {
        self.iconImg.frame = CGRectMake(padding, 0, iconW, height);
        self.nameLab.frame = CGRectMake(iconW + padding, 0, nameW, height);
        self.nameLab.textAlignment = NSTextAlignmentRight;
        self.width = self.nameLab.width + self.iconImg.width + padding * 3;
    }
    self.backgroundColor = [UIColor orangeColor];
}

#pragma mark - get
- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLab.font = [UIFont systemFontOfSize:AdjustFont(12)];
        _nameLab.textColor = kColor_Text_Gary;
        _nameLab.userInteractionEnabled = NO;
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
- (UIImageView *)iconImg {
    if (!_iconImg) {
        _iconImg = [[UIImageView alloc] init];
        _iconImg.contentMode = UIViewContentModeScaleAspectFit;
        _iconImg.userInteractionEnabled = NO;
        [self addSubview:_iconImg];
    }
    return _iconImg;
}

@end

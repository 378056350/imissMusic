//
//  KKHeaderView.m
//  music
//
//  Created by 郑业强 on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKHeaderView.h"

#pragma mark - 声明
@interface KKHeaderView()

@property (nonatomic, strong) UILabel *nameLab;

@end

#pragma mark - 实现
@implementation KKHeaderView

- (void)initUI {
    [self setFrame:CGRectMake(0, StatusBarHeight, SCREEN_WIDTH, countcoordinatesX(60))];
    [self nameLab];
    [self setAllowNight:YES];
    [self.nameLab setAllowNight:YES];
}

#pragma mark - set
- (void)setName:(NSString *)name {
    _name = name;
    _nameLab.attributedText = [NSAttributedString shadowAttrString:name color:kColor_Text_Gary fontSize:18 alignment:NSTextAlignmentLeft];
}

#pragma mark - get
- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(countcoordinatesX(15), 0, SCREEN_WIDTH, countcoordinatesX(60))];
        [self addSubview:_nameLab];
    }
    return _nameLab;
}

@end

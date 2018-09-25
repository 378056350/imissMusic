//
//  HomeTitle.m
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeTitle.h"

#pragma mark - 声明
@interface HomeTitle()

@property (nonatomic, strong) NSArray<NSString *> *titles;
@property (nonatomic, strong) NSMutableArray<UILabel *> *labs;
@property (nonatomic, strong) UIView *line;

@end

#pragma mark - 实现
@implementation HomeTitle

#pragma mark - 初始化
- (void)initUI {
    [self line];
}

#pragma mark - set
- (void)setConfig:(HomeConfig *)config {
    _config = config;
    [self setTitles:config.titles];
    [self bringSubviewToFront:_line];
}
- (void)setTitles:(NSArray<NSString *> *)titles {
    _titles = titles;
    [self.labs removeAllObjects];
    for (int i=0; i<titles.count; i++) {
        UILabel *lab = [[UILabel alloc] initWithFrame:({
            CGFloat width = SCREEN_WIDTH / titles.count;
            CGFloat height = 20;
            CGFloat left = i * width;
            CGFloat top = (self.height - 20) / 2;
            CGRectMake(left, top, width, height);
        })];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = [UIFont systemFontOfSize:AdjustFont(20)];
        lab.textColor = i == 0 ? kColor_Text_Gary : [kColor_Text_Gary colorWithAlphaComponent:0.3];
        lab.text = titles[i];
        [self addSubview:lab];
        [self.labs addObject:lab];
        [self.line setTop:CGRectGetMaxY(lab.frame)];
    }
}

#pragma mark - get
- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 5)];
        _line.backgroundColor = kColor_Text_Gary;
        [self addSubview:_line];
    }
    return _line;
}
- (NSMutableArray<UILabel *> *)labs {
    if (!_labs) {
        _labs = [[NSMutableArray alloc] init];
    }
    return _labs;
}

@end

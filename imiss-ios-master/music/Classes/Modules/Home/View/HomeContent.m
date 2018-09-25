//
//  HomeContent.m
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeContent.h"

#pragma mark - 声明
@interface HomeContent()

@property (nonatomic, strong) UIScrollView *scroll;

@end

#pragma mark - 实现
@implementation HomeContent

#pragma mark - 初始化
- (void)initUI {
    [self scroll];
}

#pragma mark - set
- (void)setConfig:(HomeConfig *)config {
    _config = config;
}

#pragma mark - get
- (UIScrollView *)scroll {
    if (!_scroll) {
        _scroll = [[UIScrollView alloc] initWithFrame:self.bounds];
        [self addSubview:_scroll];
        _scroll.backgroundColor = [UIColor greenColor];
    }
    return _scroll;
}

@end

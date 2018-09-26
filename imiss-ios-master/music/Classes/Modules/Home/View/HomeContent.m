//
//  HomeContent.m
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeContent.h"

#pragma mark - 声明
@interface HomeContent()<UIScrollViewDelegate> {
    NSInteger _currentIndex;
}

@property (nonatomic, strong) UIScrollView *scroll;

@end

#pragma mark - 实现
@implementation HomeContent

#pragma mark - 初始化
- (void)initUI {
    [self scroll];
    _currentIndex = 0;
}

#pragma mark - set
- (void)setConfig:(HomeConfig *)config {
    _config = config;
    [_scroll setContentSize:CGSizeMake(config.titles.count * self.width, 0)];
}

#pragma mark - 操作
// 滚动到某页
- (void)scrollWithIndex:(NSInteger)index {
    [_scroll setContentOffset:CGPointMake(index * self.width, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.delegate) {
        CGFloat originOffsetX = _currentIndex * self.width;
        CGFloat targetOffsetX = scrollView.contentOffset.x;
        CGFloat targetIndex = originOffsetX > targetOffsetX ? _currentIndex - 1 : _currentIndex + 1;
        CGFloat progress = ({
            CGFloat progress = targetIndex * self.width - scrollView.contentOffset.x;
            progress = ABS(progress);
            if (progress > self.width) {
                progress = progress - self.width;
            }
            progress = 1 - progress / self.width;
            progress;
        });
        [self.delegate homeContent:self progress:progress originalIndex:_currentIndex targetIndex:targetIndex];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.delegate) {
        _currentIndex = scrollView.contentOffset.x / self.width;
        [self.delegate homeContent:self progress:1 originalIndex:_currentIndex targetIndex:_currentIndex];
    }
}

#pragma mark - get
- (UIScrollView *)scroll {
    if (!_scroll) {
        _scroll = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scroll.delegate = self;
        _scroll.pagingEnabled = YES;
        [self addSubview:_scroll];
    }
    return _scroll;
}

@end

//
//  BaseView.m
//  KKTest
//
//  Created by RY on 17/6/12.
//  Copyright © 2017年 OuDa. All rights reserved.
//

#import "BaseView.h"

#pragma mark - 实现
@implementation BaseView

#pragma mark - 加载
// 加载第一个nib
+ (instancetype)loadFirstNib:(CGRect)frame {
    BaseView *view = [self loadNib:0 frame:frame];
    [view initUI];
    return view;
}
// 加载最后一个nib
+ (instancetype)loadLastNib:(CGRect)frame {
    NSInteger index = [self getViews].count - 1;
    BaseView *view = [self loadNib:index frame:frame];
    [view initUI];
    return view;
}
// 从代码创建view
+ (instancetype)loadCode:(CGRect)frame {
    BaseView *view = [[[self class] alloc] initWithFrame:frame];
    [view initUI];
    return view;
}
// 加载指定nib
+ (instancetype)loadNib:(NSInteger)index frame:(CGRect)frame {
    NSString *name = NSStringFromClass(self);
    BaseView *view = [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil][index];
    view.frame = frame;
    return view;
}

// 获取XIB中View个数
+ (NSArray *)getViews {
    NSString *name = NSStringFromClass(self);
    return [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil];
}

// 初始化UI
- (void)initUI {
    [self emptyView];
}

#pragma mark - 占位页
- (EmptyView *)emptyView {
    if (!_emptyView) {
        _emptyView = [[EmptyView alloc] init];
        [self addSubview:_emptyView];
    }
    else {
        _emptyView.frame = self.bounds;
    }
    return _emptyView;
}

/// 初始化空视图
- (void)showEmptyView:(EmptyState)state eventBlock:(EmptyViewEventBlock)eventBlock {
    [self.emptyView hide];
    _emptyView = [[EmptyView alloc] init];
    [self addSubview:_emptyView];
    [self.emptyView setState:state];
    [self.emptyView setEvent:eventBlock];
    [self.emptyView show];
}
/// 初始化空视图
- (void)showEmptyView:(EmptyState)state backButton:(BOOL)backButton eventBlock:(EmptyViewEventBlock)eventBlock {
    [self.emptyView hide];
    _emptyView = [[EmptyView alloc] init];
    [self addSubview:_emptyView];
    [self.emptyView setState:state];
    [self.emptyView setEvent:eventBlock];
    [self.emptyView show];
}
/// 初始化空视图
- (void)showEmptyView:(EmptyState)state inView:(UIView *)inview eventBlock:(EmptyViewEventBlock)eventBlock {
    [self.emptyView hide];
    _emptyView = [[EmptyView alloc] init];
    [self addSubview:_emptyView];
    [self.emptyView setState:state];
    [self.emptyView setEvent:eventBlock];
    [self.emptyView show];
}
/// 隐藏视图
- (void)hideEmptyView {
    [self.emptyView hide];
}

@end


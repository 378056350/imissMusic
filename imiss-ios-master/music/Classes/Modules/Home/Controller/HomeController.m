//
//  HomeController.m
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeController.h"
#import "HomeTitle.h"
#import "HomeContent.h"
#import "HomeCollection.h"

#pragma mark - 声明
@interface HomeController()<HomeTitleDelegate, HomeContentDelegate>

@property (nonatomic, strong) HomeConfig *config;
@property (nonatomic, strong) HomeTitle *header;
@property (nonatomic, strong) HomeContent *scroll;
@property (nonatomic, strong) HomeCollection *collection;

@end

#pragma mark - 实现
@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setJz_wantsNavigationBarVisible:NO];
    [self header];
    [self scroll];
}

#pragma mark - HomeTitleDelegate
- (void)homeTitle:(HomeTitle *)content selectedIndex:(NSInteger)selectedIndex {
    [_scroll scrollWithIndex:selectedIndex];
}

#pragma mark - HomeContentDelegate
- (void)homeContent:(HomeContent *)content progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [_header setProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

#pragma mark - get
- (HomeConfig *)config {
    if (!_config) {
        _config = [HomeConfig shareConfig];
        _config.titles = @[@"PUPULAR", @"RECOMMEND"];
        _config.views = @[self.collection, [UIView new]];
    }
    return _config;
}
- (HomeTitle *)header {
    if (!_header) {
        _header = [HomeTitle loadCode:CGRectMake(0, StatusBarHeight, SCREEN_WIDTH, 44)];
        _header.config = [self config];
        _header.delegate = self;
        [self.view addSubview:_header];
    }
    return _header;
}
- (HomeContent *)scroll {
    if (!_scroll) {
        _scroll = [HomeContent loadCode:({
            CGFloat top = CGRectGetMaxY(_header.frame);
            CGFloat height = SCREEN_HEIGHT - TabbarHeight - top;
            CGRectMake(0, top, SCREEN_WIDTH, height);
        })];
        _scroll.config = [self config];
        _scroll.delegate = self;
        [self.view addSubview:_scroll];
    }
    return _scroll;
}
- (HomeCollection *)collection {
    if (!_collection) {
        _collection = [HomeCollection initWithFrame:({
            CGFloat top = CGRectGetMaxY(_header.frame);
            CGFloat height = SCREEN_HEIGHT - TabbarHeight - top;
            CGRectMake(0, 0, SCREEN_WIDTH, height);
        })];
    }
    return _collection;
}

@end

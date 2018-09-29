//
//  HomeController.m
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeController.h"
#import "HomeContent.h"
#import "DetailController.h"
#import "MusicController.h"
#import "DetailCollectionTransition.h"
#import "MusicCollectionTransition.h"

#pragma mark - 声明
@interface HomeController()<HomeTitleDelegate, HomeContentDelegate, HomeCollectionDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) HomeConfig *config;
@property (nonatomic, strong) HomeContent *scroll;

@end

#pragma mark - 实现
@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setJz_wantsNavigationBarVisible:NO];
    [self header];
    [self scroll];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.progress = 0.3;
    });
}



#pragma mark - HomeCollectionDelegate
// 点击Cell
- (void)homeCollection:(HomeCollection *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath cell:(HomeCollectionCell *)cell {
    // 选中
    _selectCell = cell;
    // 跳转
    DetailController *vc = [[DetailController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - HomeTitleDelegate
- (void)homeTitle:(HomeTitle *)content selectedIndex:(NSInteger)selectedIndex {
    [_scroll scrollWithIndex:selectedIndex];
}

#pragma mark - HomeContentDelegate
- (void)homeContent:(HomeContent *)content progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [_header setProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}


#pragma mark - UINavigationControllerDelegate
// 转场动画
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    // Push
    if (operation == UINavigationControllerOperationPush) {
        // 详情页
        if ([toVC isKindOfClass:[DetailController class]]) {
            return [DetailCollectionTransition transitionWithTransitionType:DetailCollectionTransitionTypePush];
        }
        // 播放页
        else if ([toVC isKindOfClass:[MusicController class]]) {
            return [MusicCollectionTransition transitionWithTransitionType:MusicCollectionTransitionPush];
        }
    }
    // Pop
    else if (operation == UINavigationControllerOperationPop) {
        // 详情页
        if ([toVC isKindOfClass:[DetailController class]]) {
            return [DetailCollectionTransition transitionWithTransitionType:DetailCollectionTransitionTypePop];
        }
        // 播放页
        else if ([toVC isKindOfClass:[MusicController class]]) {
            return [MusicCollectionTransition transitionWithTransitionType:MusicCollectionTransitionPop];
        }
    }
    return nil;
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
        _header = [HomeTitle loadCode:CGRectMake(0, StatusBarHeight, SCREEN_WIDTH, 40)];
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
        _collection.delegate = self;
    }
    return _collection;
}

#pragma mark - 系统
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setDelegate:self];
}

@end

//
//  MusicController.m
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicController.h"
#import "MusicCollectionTransition.h"

#pragma mark - 声明
@interface MusicController()<UINavigationControllerDelegate>

@end

#pragma mark - 实现
@implementation MusicController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self navigation];
    [self cd];
    [self lyric];
    [self bottom];
    [self.view bringSubviewToFront:self.navigation];
}

#pragma mark - 动画
- (void)show {
    [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.navigation.alpha = 1;
        self.navigation.top = 0;
        self.bottom.alpha = 1;
        self.view.backgroundColor = kColor_BG;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)hide {
    [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.navigation.top = -20;
        self.view.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - get
- (MusicNavigation *)navigation {
    if (!_navigation) {
        _navigation = [MusicNavigation loadFirstNib:CGRectMake(0, -20, SCREEN_WIDTH, NavigationBarHeight)];
        [_navigation setAlpha:0];
        [self.view addSubview:_navigation];
    }
    return _navigation;
}
- (MusicCD *)cd {
    if (!_cd) {
        __weak typeof(self) weak = self;
        _cd = [MusicCD loadCode:CGRectMake(0, NavigationBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(self.navigation.frame) - self.bottom.height)];
        [_cd setAlpha:0];
        [_cd addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weak showCD:NO];
        }];
        [self.view addSubview:_cd];
    }
    return _cd
    ;
}
- (MusicLyric *)lyric {
    if (!_lyric) {
        __weak typeof(self) weak = self;
        _lyric = [MusicLyric loadCode:self.cd.frame];
        _lyric.flag.click = ^{
//            // 行数
//            NSInteger line = [weak.lyric getIndex];
//            // 当前秒数
//            NSTimeInterval second = [weak.model getSecondWithLine:line];
//            // 设置到当前秒数
//            [weak.modules setCurrentTime:second];
//            // 更改状态
//            [weak.modules setStatus:MusicLyricStatusPlay];
//            // 隐藏flag
//            [weak.lyric.flag setAlpha:0];
//            // 播放
//            [weak.modules play];
        };
        [_lyric addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weak showCD:YES];
        }];
        [self.view addSubview:_lyric];
    }
    return _lyric;
    
//    if (!_lyric) {
//        __weak typeof(self) weak = self;
//        _lyric = [MusicLyric loadCode:self.cd.frame];
//        [_lyric setAlpha:0];
//        [_lyric addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
//            [weak showCD:YES];
//        }];
//        [self.view addSubview:_lyric];
//    }
//    return _lyric;
}
- (MusicBottom *)bottom {
    if (!_bottom) {
        _bottom = [MusicBottom loadFirstNib:CGRectMake(0, SCREEN_HEIGHT - 170, SCREEN_WIDTH, 170)];
        [_bottom setBackgroundColor:kColor_BG];
        [_bottom setAlpha:0];
        [self.view addSubview:_bottom];
    }
    return _bottom;
}

#pragma mark - 设置
// 显示CD/歌词
- (void)showCD:(BOOL)isShowCD {
    [UIView animateWithDuration:.3f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _cd.alpha = isShowCD == YES ? 1 : 0;
        _lyric.alpha = isShowCD == YES? 0 : 1;
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - UINavigationControllerDelegate
// 转场动画
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPop) {
        return [MusicCollectionTransition transitionWithTransitionType:MusicCollectionTransitionPop];
    }
    return nil;
}

#pragma mark - 系统
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setDelegate:self];
}

@end

//
//  MusicController.m
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicController.h"
#import "MusicCollectionTransition.h"
#import "MusicModules.h"

#pragma mark - 声明
@interface MusicController()<UINavigationControllerDelegate, MusicModulesDelegate>

@property (nonatomic, strong) ResourceModel *resourceModel; // 资源model
@property (nonatomic, strong) MusicModules *modules;        // 管理

@end

#pragma mark - 实现
@implementation MusicController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self navigation];
    [self lyric];
    [self cd];
    [self bottom];
    [self modules];
    [self.view bringSubviewToFront:self.navigation];
    
    // 当前未播放
    if (self.modules.isPlaying == NO) {
        [self getResourceRequest];
    }
    // 已播放
    else {
        _resourceModel = self.modules.resourceModel;
        [_lyric setModel:self.modules.resourceModel];
        [_bottom setModel:self.modules.resourceModel];
    }
}

#pragma mark - 请求
// 资源请求
- (void)getResourceRequest {
    __weak typeof(self) weak = self;
    [AFNManager POST:CreateResourceRequest params:nil complete:^(APPResult *result) {
        // 成功
        if (result.status == ServiceStatusSuccess) {
            ResourceModel *model = [ResourceModel mj_objectWithKeyValues:result.data];
            [weak setResourceModel:model];
        }
        // 失败
        else {
            
        }
    }];
}

#pragma mark - set
- (void)setResourceModel:(ResourceModel *)resourceModel {
    _resourceModel = resourceModel;
    [_lyric setModel:resourceModel];
    [_bottom setModel:resourceModel];
    [self.modules setResourceModel:resourceModel];
    [self.modules setMusic:KStatic(resourceModel.mp3)];
    [self.modules play];
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
        [_cd setModel:_model];
        [_cd addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weak showCD:NO duation:0.3f];
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
            // 行数
            NSInteger line = [weak.lyric getIndex];
            // 当前秒数
            NSTimeInterval second = [weak.resourceModel getSecondWithLine:line];
            // 设置到当前秒数
            [weak.modules setCurrentTime:second];
            // 更改状态
            [weak.modules setStatus:MusicLyricStatusPlay];
            // 隐藏flag
            [weak.lyric.flag setAlpha:0];
            // 播放
            [weak.modules play];
        };
        [_lyric addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weak showCD:YES duation:0.3f];
        }];
        [self.view addSubview:_lyric];
    }
    return _lyric;
}
- (MusicBottom *)bottom {
    if (!_bottom) {
        _bottom = [MusicBottom loadFirstNib:CGRectMake(0, SCREEN_HEIGHT - 150, SCREEN_WIDTH, 150)];
        [_bottom setBackgroundColor:kColor_BG];
        [_bottom setAlpha:0];
        [self.view addSubview:_bottom];
    }
    return _bottom;
}
- (MusicModules *)modules {
    if (!_modules) {
        _modules = [MusicModules shareMusicModules];
        _modules.delegate = self;
    }
    return _modules;
}

#pragma mark - 设置
// 显示CD/歌词
- (void)showCD:(BOOL)isShowCD duation:(NSTimeInterval)duration {
    [self showCD:isShowCD duation:duration completion:nil];
}
- (void)showCD:(BOOL)isShowCD duation:(NSTimeInterval)duration completion:(void (^ __nullable)(BOOL finished))completion {
    [UIView animateWithDuration:duration delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _cd.alpha = isShowCD == YES ? 1 : 0;
        _lyric.alpha = isShowCD == YES? 0 : 1;
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}

#pragma mark - MusicModulesDelegate
// 播放失败
- (void)music:(MusicModules *)manager fail:(NSString *)music {
    
}
// 播放完成
- (void)music:(MusicModules *)manager finish:(NSString *)music {
    
}
// 播放中
- (void)music:(MusicModules *)manager playing:(NSString *)music progress:(CGFloat)progress currentTime:(NSTimeInterval)currentTime totalTime:(NSTimeInterval)totalTime {
    [self.lyric music:manager playing:music progress:progress currentTime:currentTime totalTime:totalTime];
    [self.bottom music:manager playing:music progress:progress currentTime:currentTime totalTime:totalTime];
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

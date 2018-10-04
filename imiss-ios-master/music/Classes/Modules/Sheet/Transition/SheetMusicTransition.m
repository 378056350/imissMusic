//
//  SheetMusicTransition.m
//  music
//
//  Created by 郑业强 on 2018/10/4.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SheetMusicTransition.h"
#import "SheetController.h"
#import "MusicController.h"

#pragma mark - 声明
@interface SheetMusicTransition()

@property (nonatomic, weak) UIViewController *vc;
/**手势类型*/
@property (nonatomic, assign) SheetMusicTransitionType type;

@end

#pragma mark - 实现
@implementation SheetMusicTransition

#pragma mark - 初始化
+ (instancetype)transitionWithTransitionType:(SheetMusicTransitionType)type {
    return [[self alloc] initWithTransitionType:type];
}
- (instancetype)initWithTransitionType:(SheetMusicTransitionType)type {
    if (self = [super init]) {
        _type = type;
    }
    return self;
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (_type == SheetMusicTransitionTypePush) {
        return 0.8f;
    }
    else if (_type == SheetMusicTransitionTypePop) {
        return 0.8f;
    }
    return 0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 为了将两种动画的逻辑分开，变得更加清晰，我们分开书写逻辑，
    switch (_type) {
        case SheetMusicTransitionTypePush:
            [self pushAnimation:transitionContext];
            break;
            
        case SheetMusicTransitionTypePop:
            [self popAnimation:transitionContext];
            break;
    }
}
// 实现present动画逻辑代码
- (void)pushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    BaseTabBarController *tab = (BaseTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [tab hideTabbar:YES];
    
    // 歌单
    SheetController *sheetVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 音乐
    MusicController *musicVC = (MusicController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:musicVC.view];
    
    // 时间
    NSTimeInterval time = [self transitionDuration:transitionContext];
    
    
//    musicVC.cd.nameLab.alpha = 0;
//    musicVC.cd.detailLab.alpha = 0;
    
    
    //==================================== 专辑 ====================================
    UIImageView *icon = ({
        UIImageView *icon = [[UIImageView alloc] initWithFrame:[sheetVC.selectCell.icon convertRectWithWindow]];
        [icon shadowWithColor:[UIColor clearColor] offset:CGSizeMake(0, 3) opacity:1 radius:5];
        [icon setImage:sheetVC.selectCell.icon.image];
        [icon setContentMode:UIViewContentModeScaleAspectFit];
        icon;
    });
    [containerView addSubview:icon];
    
    
    // 专辑 - 中心
    POPBasicAnimation *iconBasic = ({
        CGRect rect = [musicVC.cd.icon convertRectWithWindow];
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        basic.duration  = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue   = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
        basic.completionBlock = ^(POPAnimation *anim, BOOL finished) {
            musicVC.cd.icon.image = icon.image;
        };
        basic;
    });
    [icon pop_addAnimation:iconBasic forKey:@"iconBasic"];
    
    
    POPBasicAnimation *scaleBasic = ({
        CGFloat scale = musicVC.cd.icon.height / icon.height;
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        basic.duration  = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue   = @(CGPointMake(scale, scale));
        basic.completionBlock = ^(POPAnimation *anim, BOOL finished) {
            musicVC.cd.icon.image = icon.image;
        };
        basic;
    });
    [icon.layer pop_addAnimation:scaleBasic forKey:@"scaleBasic"];
    
    
    
    
    //==================================== 歌名 ====================================
    UILabel *nameLab = ({
        UILabel *lab = [[UILabel alloc] initWithFrame:[musicVC.cd.nameLab convertRectWithWindow]];
        lab.font = musicVC.cd.nameLab.font;
        lab.text = musicVC.cd.nameLab.text;
        lab.textColor = musicVC.cd.nameLab.textColor;
        lab.textAlignment = NSTextAlignmentCenter;
        lab;
    });
    [containerView addSubview:nameLab];
    [containerView bringSubviewToFront:nameLab];

    // 歌名 - 位置
    POPBasicAnimation *nameBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basic.duration = time;
        basic.beginTime = CACurrentMediaTime();
        basic.fromValue = @(0);
        basic.toValue = @(1);
        basic;
    });
    [nameLab pop_addAnimation:nameBasic forKey:@"nameBasic"];
    
    
    
    
    
    //==================================== 歌手 ====================================
    UILabel *detailLab = ({
        UILabel *lab = [[UILabel alloc] initWithFrame:[musicVC.cd.detailLab convertRectWithWindow]];
        lab.font = musicVC.cd.detailLab.font;
        lab.text = musicVC.cd.detailLab.text;
        lab.textColor = musicVC.cd.detailLab.textColor;
        lab.textAlignment = NSTextAlignmentCenter;
        lab;
    });
    [containerView addSubview:detailLab];
    [containerView bringSubviewToFront:detailLab];
    
    // 歌名 - 位置
    POPBasicAnimation *detailBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basic.duration = time;
        basic.beginTime = CACurrentMediaTime();
        basic.fromValue = @(0);
        basic.toValue = @(1);
        basic;
    });
    [detailLab pop_addAnimation:detailBasic forKey:@"detailBasic"];
    
    
    [musicVC.bottom.controlImg setAlpha:1];
    [musicVC show];
    
    
    
    
    
    
    
    //==================================== 底部 ====================================
    UIView *bottomView = ({
        UIView *playBtn = musicVC.bottom;
        playBtn.frame = [musicVC.bottom convertRectWithWindow];
        playBtn;
    });
    [containerView addSubview:bottomView];
    
    // 歌手 - 位置
    POPBasicAnimation *bottomBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basic.duration = 0.3;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(1);
        basic;
    });
    [bottomView pop_addAnimation:bottomBasic forKey:@"bottomBasic"];
    
    
    
    
    
    //==================================== 背景 ====================================
    UIView *sheetContent = ({
        [sheetVC.selectCell.icon setHidden:YES];
        UIView *sheetContent = [sheetVC.view snapshotViewAfterScreenUpdates:NO];
        [sheetContent setFrame:[sheetVC.view convertRectWithWindow]];
        sheetContent;
    });
    [musicVC.view addSubview:sheetContent];
    [musicVC.view sendSubviewToBack:sheetContent];
    
    
    POPBasicAnimation *contentBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basic.duration = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(0);
        basic;
    });
    [sheetContent pop_addAnimation:contentBasic forKey:@"contentBasic"];
    
    
    
    
    
    
    
    
    
    
    
    
    // 动画完成
    [iconBasic setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        // 转场失败
        if ([transitionContext transitionWasCancelled]) {
            [icon removeFromSuperview];
            [sheetContent removeFromSuperview];
            
            [nameLab removeFromSuperview];
            [detailLab removeFromSuperview];
        }
        // 转场成功
        else {
            [musicVC.navigation setAlpha:1];
            [musicVC.cd setAlpha:1];
            [musicVC.cd.nameLab setAlpha:1];
            [musicVC.cd.detailLab setAlpha:1];
            [musicVC.bottom setAlpha:1];
            [musicVC.bottom.controlImg setAlpha:1];
            
            [icon removeFromSuperview];
            [sheetContent removeFromSuperview];
            [nameLab removeFromSuperview];
            [detailLab removeFromSuperview];
        }
    }];
}
// 实现dismiss动画逻辑代码
- (void)popAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 首页
    SheetController *sheetVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 播放
    MusicController *musicVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:musicVC.view];
    [containerView addSubview:sheetVC.view];
    
    // 时间
    NSTimeInterval time = [self transitionDuration:transitionContext];
    
    
    //==================================== 导航栏 ====================================
    UIImageView *navigation = ({
        UIView *navigation = [musicVC.navigation snapshotViewAfterScreenUpdates:NO];
        navigation.frame = [musicVC.navigation convertRectWithWindow];
        navigation;
    });
    [musicVC.navigation setHidden:YES];
    [containerView addSubview:navigation];
    
    // 专辑 - 透明度
    POPBasicAnimation *alphaBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basic.duration = 0.3f;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(0);
        basic;
    });
    [navigation pop_addAnimation:alphaBasic forKey:@"alphaBasic"];
    
    // 专辑 - 位置
    POPBasicAnimation *naviCenterBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.duration = 0.3f;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(CGPointMake(SCREEN_WIDTH / 2, navigation.centerY - 20));
        basic;
    });
    [navigation pop_addAnimation:naviCenterBasic forKey:@"naviCenterBasic"];
    
    
    
    //==================================== 专辑 ====================================
    UIImageView *icon = ({
        UIImageView *icon = [[UIImageView alloc] initWithFrame:[musicVC.cd.icon convertRectWithWindow]];
        icon.image = musicVC.cd.icon.image;
        icon;
    });
    [musicVC.cd.icon setHidden:YES];
    [containerView addSubview:icon];
    
    
    // 专辑 - 位置
    POPBasicAnimation *iconBasic = ({
        CGRect rect = [sheetVC.selectCell.icon convertRectWithWindow];
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        basic.duration = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
        basic;
    });
    [icon pop_addAnimation:iconBasic forKey:@"iconBasic"];
    
    
    POPBasicAnimation *scaleBasic = ({
        CGFloat scale = sheetVC.selectCell.icon.height / icon.height;
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        basic.duration  = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue   = @(CGPointMake(scale, scale));
        basic.completionBlock = ^(POPAnimation *anim, BOOL finished) {
            musicVC.cd.icon.image = icon.image;
        };
        basic;
    });
    [icon.layer pop_addAnimation:scaleBasic forKey:@"scaleBasic"];
    
    
    
    
    
    //==================================== 歌名 ====================================
    UIView *nameLab = ({
        UIView *nameLab = [musicVC.cd.nameLab snapshotViewAfterScreenUpdates:NO];
        [nameLab setFrame:[musicVC.cd.nameLab convertRectWithWindow]];
        nameLab;
    });
    [musicVC.cd.nameLab setHidden:YES];
    [containerView addSubview:nameLab];
    
    // 歌手 - 位置
    POPBasicAnimation *nameBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basic.duration = 0.3;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(0);
        basic;
    });
    [nameLab pop_addAnimation:nameBasic forKey:@"nameBasic"];
    
    //==================================== 歌手 ====================================
    UIView *detailLab = ({
        UIView *detailLab = [musicVC.cd.detailLab snapshotViewAfterScreenUpdates:NO];
        [detailLab setFrame:[musicVC.cd.detailLab convertRectWithWindow]];
        detailLab;
    });
    [musicVC.cd.detailLab setHidden:YES];
    [containerView addSubview:detailLab];
    
    // 歌手 - 位置
    POPBasicAnimation *detailBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basic.duration = 0.3;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(0);
        basic;
    });
    [detailLab pop_addAnimation:detailBasic forKey:@"detailBasic"];
    
    
    
    
    //==================================== 底部 ====================================
    UIView *bottomView = ({
        UIView *playBtn = musicVC.bottom;
        playBtn.frame = [musicVC.bottom convertRectWithWindow];
        playBtn;
    });
    [containerView addSubview:bottomView];
    
    // 歌手 - 位置
    POPBasicAnimation *bottomBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basic.duration = 0.3;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(0);
        basic;
    });
    [bottomView pop_addAnimation:bottomBasic forKey:@"bottomBasic"];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //==================================== 背景 ====================================
    UIView *sheetContent = ({
        UIView *sheetContent = [[UIView alloc] init];
        sheetContent.frame = [sheetVC.view convertRectWithWindow];
        sheetContent.backgroundColor = kColor_BG;
        sheetContent;
    });
    [containerView insertSubview:sheetContent aboveSubview:sheetVC.view];
    
    POPBasicAnimation *contentBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basic.duration = time;
        basic.beginTime = CACurrentMediaTime();
        basic.fromValue = @(1);
        basic.toValue = @(0);
        basic;
    });
    [sheetContent pop_addAnimation:contentBasic forKey:@"contentBasic"];
    
    
    
    
    
    
    
    
    // 动画完成
    [iconBasic setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        // 转场失败
        if ([transitionContext transitionWasCancelled]) {
            [icon removeFromSuperview];
            [nameLab removeFromSuperview];
            [detailLab removeFromSuperview];
            [sheetContent removeFromSuperview];
        }
        // 转场成功
        else {
            [sheetVC.selectCell.icon setHidden:NO];
            
            [icon removeFromSuperview];
            [nameLab removeFromSuperview];
            [detailLab removeFromSuperview];
            [sheetContent removeFromSuperview];
        }
    }];
}


@end

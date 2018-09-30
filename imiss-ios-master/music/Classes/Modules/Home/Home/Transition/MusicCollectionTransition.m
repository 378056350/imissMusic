//
//  MusicCollectionTransition.m
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicCollectionTransition.h"
#import "MusicController.h"

#pragma mark - 声明
@interface MusicCollectionTransition()

@property (nonatomic, weak) UIViewController *vc;
/**手势类型*/
@property (nonatomic, assign) MusicCollectionTransitionType type;

@end

#pragma mark - 实现
@implementation MusicCollectionTransition

#pragma mark - 初始化
+ (instancetype)transitionWithTransitionType:(MusicCollectionTransitionType)type {
    return [[self alloc] initWithTransitionType:type];
}
- (instancetype)initWithTransitionType:(MusicCollectionTransitionType)type {
    if (self = [super init]) {
        _type = type;
    }
    return self;
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (_type == MusicCollectionTransitionPush) {
        return 0.5f;
    }
    else if (_type == MusicCollectionTransitionPop) {
        return 0.5f;
    }
    return 0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 为了将两种动画的逻辑分开，变得更加清晰，我们分开书写逻辑，
    switch (_type) {
        case MusicCollectionTransitionPush:
            [self presentAnimation:transitionContext];
            break;
            
        case MusicCollectionTransitionPop:
            [self dismissAnimation:transitionContext];
            break;
    }
}
// 实现present动画逻辑代码
- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    BaseTabBarController *tab = (BaseTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [tab hideTabbar:YES];
    // 首页
    HomeController *homeVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 音乐
    MusicController *musicVC = (MusicController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:musicVC.view];
    
    
    // 时间
    NSTimeInterval time = [self transitionDuration:transitionContext];
    
    
    //==================================== 专辑 ====================================
    UIImageView *icon = ({
        UIImageView *icon = [[UIImageView alloc] initWithFrame:[homeVC.selectCell.icon convertRectWithWindow]];
        [icon shadowWithColor:[UIColor clearColor] offset:CGSizeMake(0, 3) opacity:1 radius:5];
        [icon setImage:homeVC.selectCell.icon.image];
        [icon setContentMode:UIViewContentModeScaleAspectFit];
        icon;
    });
    [containerView addSubview:icon];
    
    // 专辑 - 中心
    POPBasicAnimation *iconBasic = ({
        CGRect rect = [musicVC.cd.icon convertRectWithWindow];
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.duration  = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue   = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
        basic.completionBlock = ^(POPAnimation *anim, BOOL finished) {
            musicVC.cd.icon.image = icon.image;
        };
        basic;
    });
    [icon pop_addAnimation:iconBasic forKey:@"iconBasic"];
    
    
    // 专辑 - 阴影
    POPBasicAnimation *shadowBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerShadowColor];
        basic.duration  = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue   = (__bridge id)([kColor_Text_Gary colorWithAlphaComponent:0.5].CGColor);
        basic;
    });
    [icon.layer pop_addAnimation:shadowBasic forKey:@"shadowBasic"];
    
    
    // 专辑 - 比例
    CABasicAnimation *anim = ({
        CGFloat scale = musicVC.cd.icon.height / icon.height;
        
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = -1.f / 1000.f;
        transform = CATransform3DScale(transform, scale, scale, 1);
        
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
        anim.duration     = time - 0.2;
        anim.beginTime    = CACurrentMediaTime();
        anim.autoreverses = NO;
        anim.toValue      = [NSValue valueWithCATransform3D:transform];
        anim.fillMode     = kCAFillModeForwards;
        anim.removedOnCompletion = NO;
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        anim;
    });
    [icon.layer addAnimation:anim forKey:nil];
    
    
    
    // 首页文字
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        homeVC.header.top -= 10;
        homeVC.collection.nameLab.top += 20;
    } completion:^(BOOL finished) {
        
    }];
    
    
    
    
    
    //==================================== 歌名 ====================================
    UIView *nameLab = ({
        UIView *lab = [homeVC.selectCell.nameLab snapshotViewAfterScreenUpdates:NO];
        [lab setFrame:[homeVC.selectCell.nameLab convertRectWithWindow]];
        [containerView addSubview:lab];
        lab;
    });
    
    // 歌名 - 位置
    POPBasicAnimation *nameBasic = ({
        CGRect rect = [musicVC.cd.nameLab convertRectWithWindow];
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.duration = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
        basic;
    });
    [nameLab pop_addAnimation:nameBasic forKey:@"nameBasic"];
    
    
    
    
    //==================================== 歌手 ====================================
    UIView *detailLab = ({
        UIView *detailLab = [homeVC.selectCell.detailLab snapshotViewAfterScreenUpdates:NO];
        [detailLab setFrame:[homeVC.selectCell.detailLab convertRectWithWindow]];
        [containerView addSubview:detailLab];
        detailLab;
    });
    
    // 歌手 - 位置
    POPBasicAnimation *detailBasic = ({
        CGRect rect = [musicVC.cd.detailLab convertRectWithWindow];
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.duration = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
        basic;
    });
    [detailLab pop_addAnimation:detailBasic forKey:@"detailBasic"];
    
    
    
    
    //==================================== 按钮 ====================================
    UIView *playBtn = ({
        UIView *playBtn = [homeVC.selectCell.playBtn snapshotViewAfterScreenUpdates:NO];
        [playBtn setFrame:[homeVC.selectCell.playBtn convertRectWithWindow]];
        [containerView addSubview:playBtn];
        playBtn;
    });
    
    // 歌手 - 位置
    POPBasicAnimation *playBasic = ({
        CGRect rect = [musicVC.bottom.controlBtn convertRectWithWindow];
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.duration = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
        basic;
    });
    [playBtn pop_addAnimation:playBasic forKey:@"playBasic"];
    
    
    // 歌手 - 旋转
    CABasicAnimation *playAnim = ({
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        anim.beginTime    = CACurrentMediaTime();
        anim.duration     = time;
        anim.autoreverses = NO;
        anim.fromValue    = [NSNumber numberWithFloat:0];
        anim.toValue      = [NSNumber numberWithFloat:M_PI * 2];
        anim.fillMode     = kCAFillModeForwards;
        anim.removedOnCompletion = NO;
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        anim;
    });
    [playBtn.layer addAnimation:playAnim forKey:nil];
    
    
    
    
    [musicVC show];
    
    
    
    [homeVC.selectCell.icon setHidden:YES];
    [homeVC.selectCell.nameLab setHidden:YES];
    [homeVC.selectCell.detailLab setHidden:YES];
    [homeVC.selectCell.playBtn setHidden:YES];
    
    
    
    // 动画完成
    [playBasic setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        // 转场失败
        if ([transitionContext transitionWasCancelled]) {
            homeVC.selectCell.icon.hidden = NO;
        }
        // 转场成功
        else {
            [musicVC.cd setAlpha:1];
            [musicVC.bottom.controlImg setAlpha:1];
            [musicVC.view bringSubviewToFront:musicVC.cd];
            [icon removeFromSuperview];
            [nameLab removeFromSuperview];
            [detailLab removeFromSuperview];
            [playBtn removeFromSuperview];
        }
    }];
}
// 实现dismiss动画逻辑代码
- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 首页
    HomeController *homeVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 播放
    MusicController *musicVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:musicVC.view];
    [containerView addSubview:homeVC.view];
    
    // 时间
    NSTimeInterval time = [self transitionDuration:transitionContext];
    
    // 首页文字
    [UIView animateWithDuration:.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        homeVC.header.top += 10;
        homeVC.collection.nameLab.top -= 20;
    } completion:^(BOOL finished) {
        
    }];
    
    
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
    
    
    
    
    //==================================== 背景 ====================================
    UIView *musicBg = ({
        UIView *musicBg = [[UIView alloc] initWithFrame:musicVC.view.frame];
        musicBg.backgroundColor = kColor_BG;
        musicBg;
    });
    [containerView addSubview:musicBg];
    // 专辑 - 位置
    POPBasicAnimation *backAlphaBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basic.duration = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(0);
        basic;
    });
    [musicBg pop_addAnimation:backAlphaBasic forKey:@"backAlphaBasic"];
    
    
    
    
    
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
        CGRect rect = [homeVC.selectCell.icon convertRectWithWindow];
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.duration = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
        basic;
    });
    [icon pop_addAnimation:iconBasic forKey:@"iconBasic"];
    
    
    // 专辑 - 比例
    CABasicAnimation *anim = ({
        CGFloat scale = homeVC.selectCell.icon.height / icon.height;
        
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = -1.f / 1000.f;
        transform = CATransform3DScale(transform, scale, scale, 1);
        
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
        anim.duration     = 0.3;
        anim.beginTime    = CACurrentMediaTime();
        anim.autoreverses = NO;
        anim.toValue      = [NSValue valueWithCATransform3D:transform];
        anim.fillMode     = kCAFillModeForwards;
        anim.removedOnCompletion = NO;
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        anim;
    });
    [icon.layer addAnimation:anim forKey:nil];
    
    
    //==================================== 歌名 ====================================
    UIView *nameLab = ({
        UIView *nameLab = [musicVC.cd.nameLab snapshotViewAfterScreenUpdates:NO];
        [nameLab setFrame:[musicVC.cd.nameLab convertRectWithWindow]];
        nameLab;
    });
    [musicVC.cd.nameLab setHidden:YES];
    [containerView addSubview:nameLab];
    
    // 歌名 - 位置
    POPBasicAnimation *nameBasic = ({
        CGRect rect = [homeVC.selectCell.nameLab convertRectWithWindow];
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.duration = 0.3;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
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
        CGRect rect = [homeVC.selectCell.detailLab convertRectWithWindow];
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.duration = 0.3;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
        basic;
    });
    [detailLab pop_addAnimation:detailBasic forKey:@"detailBasic"];
    
    
    
    //==================================== 播放 ====================================
    UIView *playBtn = ({
        UIView *playBtn = [musicVC.bottom.controlImg snapshotViewAfterScreenUpdates:NO];
        playBtn.frame = [musicVC.bottom.controlImg convertRectWithWindow];
        playBtn;
    });
    [containerView addSubview:playBtn];

    
    // 歌手 - 位置
    POPBasicAnimation *playBasic = ({
        CGRect fromRect = [musicVC.bottom.controlImg convertRectWithWindow];
        CGRect toRect = [homeVC.selectCell.playBtn convertRectWithWindow];
        
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.duration = 0.3;
        basic.beginTime = CACurrentMediaTime();
        basic.fromValue = @(CGPointMake(CGRectGetMidX(fromRect), CGRectGetMidY(fromRect)));
        basic.toValue = @(CGPointMake(CGRectGetMidX(toRect), CGRectGetMidY(toRect)));
        basic;
    });
    [playBtn pop_addAnimation:playBasic forKey:@"playBasic"];
    
    
    
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
    
    
    
    [musicVC hide];
    
    
    
    
    
    // 动画完成
    [iconBasic setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        // 转场失败
        if ([transitionContext transitionWasCancelled]) {
            [icon removeFromSuperview];
            [nameLab removeFromSuperview];
            [detailLab removeFromSuperview];
            [playBtn removeFromSuperview];
            [bottomView removeFromSuperview];
            [musicBg removeFromSuperview];
        }
        // 转场成功
        else {
            [homeVC.selectCell.icon setHidden:NO];
            [homeVC.selectCell.nameLab setHidden:NO];
            [homeVC.selectCell.detailLab setHidden:NO];
            [homeVC.selectCell.playBtn setHidden:NO];
            [homeVC.selectCell.playBtn setImage:musicVC.bottom.controlImg.image forState:UIControlStateNormal];
            [homeVC.selectCell.playBtn setImage:musicVC.bottom.controlImg.image forState:UIControlStateHighlighted];
            [icon removeFromSuperview];
            [nameLab removeFromSuperview];
            [detailLab removeFromSuperview];
            [playBtn removeFromSuperview];
            [bottomView removeFromSuperview];
            [musicBg removeFromSuperview];
        }
    }];
}

@end

//
//  DetailCollectionTransition.m
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DetailCollectionTransition.h"
#import "HomeCollection.h"
#import "DetailController.h"

#pragma mark - 声明
@interface DetailCollectionTransition ()

@property (nonatomic, weak) UIViewController *vc;
/**手势类型*/
@property (nonatomic, assign) DetailCollectionTransitionType type;

@end

#pragma mark - 实现
@implementation DetailCollectionTransition

#pragma mark - 初始化
+ (instancetype)transitionWithTransitionType:(DetailCollectionTransitionType)type {
    return [[self alloc] initWithTransitionType:type];
}
- (instancetype)initWithTransitionType:(DetailCollectionTransitionType)type {
    if (self = [super init]) {
        _type = type;
    }
    return self;
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (_type == DetailCollectionTransitionTypePresent) {
        return 0.8f;
    }
    else if (_type == DetailCollectionTransitionTypeDismiss) {
        return 0.5f;
    }
    return 0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 为了将两种动画的逻辑分开，变得更加清晰，我们分开书写逻辑，
    switch (_type) {
        case DetailCollectionTransitionTypePresent:
            [self presentAnimation:transitionContext];
            break;
            
        case DetailCollectionTransitionTypeDismiss:
            [self dismissAnimation:transitionContext];
            break;
    }
}
// 实现present动画逻辑代码
- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    HomeController *homeVC = ({
        BaseTabBarController *tab = (BaseTabBarController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        HomeController *vc = [(BaseNavigationController *)tab.childViewControllers[0] viewControllers][0];
        vc;
    });
    DetailController *detailVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    // 初始化控件
    UIImageView *cell = [[UIImageView alloc] initWithFrame:[homeVC.selectCell.content convertRectWithWindow]];
    [cell setImage:[homeVC.selectCell.content imageFromView]];
    [detailVC.view addSubview:cell];
    [homeVC.selectCell setHidden:YES];
    [containerView addSubview:detailVC.view];
   
    // 动画
    NSTimeInterval time = [self transitionDuration:transitionContext];
    
    // 旋转
    CGFloat scale = detailVC.contentV.height / cell.height;
    detailVC.contentV.centerX = SCREEN_WIDTH / 2;
    
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34 = -1.f / 1000.f;
    transform3D = CATransform3DRotate(transform3D, M_PI, 0, -1, 0);
    transform3D = CATransform3DScale(transform3D, scale, scale, 1);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.duration     = time / 2;
    animation.beginTime    = CACurrentMediaTime();
    animation.autoreverses = NO;
    animation.toValue      = [NSValue valueWithCATransform3D:transform3D];
    animation.fillMode     = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [cell.layer addAnimation:animation forKey:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time / 2 / 2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cell.image = nil;
        cell.backgroundColor = [UIColor whiteColor];
    });
    
    // 圆角
    POPBasicAnimation *basic5 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerCornerRadius];
    basic5.duration  = time;
    basic5.beginTime = CACurrentMediaTime();
    basic5.toValue   = @(5);
    [cell.layer pop_addAnimation:basic5 forKey:@"basic5"];
    
    // 位置
    POPBasicAnimation *basic4 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    basic4.duration  = time;
    basic4.beginTime = CACurrentMediaTime();
    basic4.toValue   = @(detailVC.contentV.center);
    [cell pop_addAnimation:basic4 forKey:@"basic4"];

    // 按钮
    [detailVC show];
    
    // 动画完成
    [basic4 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        // 转场失败
        if ([transitionContext transitionWasCancelled]) {
            [cell removeFromSuperview];
        }
        // 转场成功
        else {
            [cell removeFromSuperview];
            [detailVC.contentV setAlpha:1];
            [detailVC.view bringSubviewToFront:cell];
            [detailVC.view sendSubviewToBack:detailVC.contentV];
        }
    }];
}
// 实现dismiss动画逻辑代码
- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    HomeController *homeVC = ({
        BaseTabBarController *tab = (BaseTabBarController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        HomeController *vc = [(BaseNavigationController *)tab.childViewControllers[0] viewControllers][0];
        vc;
    });
    DetailController *detailVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval time = [self transitionDuration:transitionContext];
    
    // 圆角
    POPBasicAnimation *basic5 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerCornerRadius];
    basic5.duration  = time;
    basic5.beginTime = CACurrentMediaTime();
    basic5.toValue   = @(0);
    [detailVC.contentV.layer pop_addAnimation:basic5 forKey:@"basic5"];
    
    // 位置
    POPBasicAnimation *basic1 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    basic1.duration  = time;
    basic1.beginTime = CACurrentMediaTime();
    basic1.toValue   = @([homeVC.selectCell.content convertRectWithWindow]);
    [detailVC.contentV pop_addAnimation:basic1 forKey:@"basic1"];
    
    // 按钮
    [detailVC hide];
    
    // 动画完成
    [basic1 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        // 转场失败
        if ([transitionContext transitionWasCancelled]) {
//            [cell removeFromSuperview];
        }
        // 转场成功
        else {
            [homeVC.selectCell setHidden:NO];
//            [cell removeFromSuperview];
//            [detailVC.contentV setAlpha:1];
//            [detailVC.view bringSubviewToFront:cell];
//            [detailVC.view sendSubviewToBack:detailVC.contentV];
        }
    }];
    
}


@end

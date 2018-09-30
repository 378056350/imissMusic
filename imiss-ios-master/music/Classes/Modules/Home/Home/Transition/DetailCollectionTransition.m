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
    if (_type == DetailCollectionTransitionTypePush) {
        return 0.8f;
    }
    else if (_type == DetailCollectionTransitionTypePop) {
        return 0.5f;
    }
    return 0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 为了将两种动画的逻辑分开，变得更加清晰，我们分开书写逻辑，
    switch (_type) {
        case DetailCollectionTransitionTypePush:
            [self presentAnimation:transitionContext];
            break;
            
        case DetailCollectionTransitionTypePop:
            [self dismissAnimation:transitionContext];
            break;
    }
}
// 实现present动画逻辑代码
- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    HomeController *homeVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    DetailController *detailVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    // 初始化控件
    UIImageView *cell = [[UIImageView alloc] initWithFrame:[homeVC.selectCell.content convertRectWithWindow]];
    [cell setImage:[homeVC.selectCell.content imageFromView]];
    [detailVC.view addSubview:cell];
    [homeVC.selectCell setAlpha:0];
    [containerView addSubview:detailVC.view];
   
    // 时间
    NSTimeInterval time = [self transitionDuration:transitionContext];
    
    // 旋转
    CGFloat scale = detailVC.contentV.height / cell.height;
    detailVC.contentV.centerX = SCREEN_WIDTH / 2;
    
    CATransform3D transform3D = ({
        CATransform3D transform3D = CATransform3DIdentity;
        transform3D.m34 = -1.f / 1000.f;
        transform3D = CATransform3DRotate(transform3D, M_PI, 0, -1, 0);
        transform3D = CATransform3DScale(transform3D, scale, scale, 1);
        transform3D;
    });
    
    CABasicAnimation *animation = ({
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.duration     = time / 2;
        animation.beginTime    = CACurrentMediaTime();
        animation.autoreverses = NO;
        animation.toValue      = [NSValue valueWithCATransform3D:transform3D];
        animation.fillMode     = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation;
    });
    [cell.layer addAnimation:animation forKey:nil];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time / 2 / 2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cell.image = nil;
        cell.backgroundColor = [UIColor whiteColor];
    });
    
    // 圆角
    POPBasicAnimation *basic5 = ({
        POPBasicAnimation *basic5 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerCornerRadius];
        basic5.duration  = time;
        basic5.beginTime = CACurrentMediaTime();
        basic5.toValue   = @(5);
        basic5;
    });
    [cell.layer pop_addAnimation:basic5 forKey:@"basic5"];
    
    // 位置
    POPBasicAnimation *basic4 = ({
        POPBasicAnimation *basic4 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic4.duration  = time;
        basic4.beginTime = CACurrentMediaTime();
        basic4.toValue   = @(detailVC.contentV.center);
        basic4;
    });
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
            
            // Push完成, Home会消失, 所以截屏Home, 添加为背景
            UIImageView *bg = ({
                UIImageView *bg = [[UIImageView alloc] initWithFrame:SCREEN_BOUNDS];
                [bg setImage:[homeVC.view imageFromView]];
                UIView *view = [[UIView alloc] initWithFrame:bg.bounds];
                [view setBackgroundColor:[kColor_Text_Black colorWithAlphaComponent:0.2]];
                [bg addSubview:view];
                bg;
            });
            [detailVC.view addSubview:bg];
            [detailVC.view insertSubview:bg belowSubview:detailVC.contentV];
            
            [detailVC.contentV show];
            [detailVC.contentV setAlpha:1];
            [detailVC.view bringSubviewToFront:cell];
        }
    }];
}
// 实现dismiss动画逻辑代码
- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    HomeController *homeVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    DetailController *detailVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:homeVC.view];
    [containerView addSubview:detailVC.view];
    
    
    UIView *cell = ({
        UIView *cell = [detailVC.contentV snapshotViewAfterScreenUpdates:NO];
        [cell setFrame:[detailVC.contentV convertRectWithWindow]];
//        [cell shadowWithColor:kColor_Text_Gary offset:CGSizeMake(0, 5) opacity:1 radius:5];
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:cell.bounds];
        [cell addSubview:icon];
        [icon setTag:10];
        [icon setAlpha:0];
        cell;
    });
    [detailVC.contentV setHidden:YES];
    [cell.layer setZPosition:9999];
    [containerView addSubview:cell];
    [containerView bringSubviewToFront:cell];
    [homeVC.selectCell setAlpha:0];
    
    
    // 时间
    NSTimeInterval time = [self transitionDuration:transitionContext];
    
    
    // 背景色
    POPBasicAnimation *bgBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basic.duration  = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue   = @(0);
        basic;
    });
    [detailVC.view pop_addAnimation:bgBasic forKey:@"bgBasic"];
    
    
    
    // 圆角
    POPBasicAnimation *cornerBasic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerCornerRadius];
        basic.duration  = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue   = @(0);
        basic;
    });
    [cell.layer pop_addAnimation:cornerBasic forKey:@"cornerBasic"];
    
    
    // 中心
    POPBasicAnimation *frameBasic = ({
        CGRect rect = [homeVC.selectCell.content convertRectWithWindow];
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.duration  = time;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue   = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
        basic;
    });
    [cell pop_addAnimation:frameBasic forKey:@"frameBasic"];
    
    
    
    
    // 比例
    CATransform3D transform3D = ({
        CGFloat scale = homeVC.selectCell.content.height / detailVC.contentV.height;
        CATransform3D transform3D = CATransform3DIdentity;
        transform3D.m34 = -1 / 1000.f;
        transform3D = CATransform3DRotate(transform3D, M_PI, 0, -1, 0);
        transform3D = CATransform3DScale(transform3D, scale, scale, 1);
        transform3D;
    });
    
    CABasicAnimation *animation = ({
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.duration     = time / 2;
        animation.beginTime    = CACurrentMediaTime();
        animation.autoreverses = NO;
        animation.toValue      = [NSValue valueWithCATransform3D:transform3D];
        animation.fillMode     = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation;
    });
    [cell.layer addAnimation:animation forKey:nil];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time / 2 / 2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [cell.maskView removeFromSuperview];
        
        UIImageView *icon = [cell viewWithTag:10];
        icon.image = [homeVC.selectCell.content imageFromView];
        icon.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
        icon.alpha = 1;
    });
    
    
    
    // 按钮
    [detailVC hide];
    
    // 动画完成
    [cornerBasic setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        // 转场失败
        if ([transitionContext transitionWasCancelled]) {
            [cell removeFromSuperview];
        }
        // 转场成功
        else {
            [cell removeFromSuperview];
            [homeVC.selectCell setAlpha:1];
            [homeVC viewDidAppear:YES];
        }
    }];
    
}


@end

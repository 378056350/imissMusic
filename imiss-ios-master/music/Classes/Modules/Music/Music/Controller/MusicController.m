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
@interface MusicController()<UIViewControllerTransitioningDelegate>

@end

#pragma mark - 实现
@implementation MusicController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    // 初始化presentType
    return [MusicCollectionTransition transitionWithTransitionType:MusicCollectionTransitionPresent];
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    // 初始化dismissType
    return [MusicCollectionTransition transitionWithTransitionType:MusicCollectionTransitionDismiss];
}

@end

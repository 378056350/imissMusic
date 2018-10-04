//
//  HomeMusicTransition.h
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - enum
typedef NS_ENUM(NSUInteger, HomeMusicTransitionType) {
    HomeMusicTransitionPush = 0,
    HomeMusicTransitionPop
};

#pragma mark - 声明
@interface HomeMusicTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithTransitionType:(HomeMusicTransitionType)type;
- (instancetype)initWithTransitionType:(HomeMusicTransitionType)type;

@end

NS_ASSUME_NONNULL_END

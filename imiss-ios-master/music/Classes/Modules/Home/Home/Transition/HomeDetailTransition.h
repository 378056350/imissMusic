//
//  HomeDetailTransition.h
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - enum
typedef NS_ENUM(NSUInteger, HomeDetailTransitionType) {
    HomeDetailTransitionTypePush = 0,
    HomeDetailTransitionTypePop
};

#pragma mark - 声明
@interface HomeDetailTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithTransitionType:(HomeDetailTransitionType)type;
- (instancetype)initWithTransitionType:(HomeDetailTransitionType)type;

@end

NS_ASSUME_NONNULL_END

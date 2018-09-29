//
//  DetailCollectionTransition.h
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - enum
typedef NS_ENUM(NSUInteger, DetailCollectionTransitionType) {
    DetailCollectionTransitionTypePush = 0,
    DetailCollectionTransitionTypePop
};

#pragma mark - 声明
@interface DetailCollectionTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithTransitionType:(DetailCollectionTransitionType)type;
- (instancetype)initWithTransitionType:(DetailCollectionTransitionType)type;

@end

NS_ASSUME_NONNULL_END

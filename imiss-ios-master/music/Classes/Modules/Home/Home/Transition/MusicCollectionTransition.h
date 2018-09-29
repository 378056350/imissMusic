//
//  MusicCollectionTransition.h
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - enum
typedef NS_ENUM(NSUInteger, MusicCollectionTransitionType) {
    MusicCollectionTransitionPush = 0,
    MusicCollectionTransitionPop
};

#pragma mark - 声明
@interface MusicCollectionTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithTransitionType:(MusicCollectionTransitionType)type;
- (instancetype)initWithTransitionType:(MusicCollectionTransitionType)type;

@end

NS_ASSUME_NONNULL_END

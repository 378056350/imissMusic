//
//  SheetMusicTransition.h
//  music
//
//  Created by 郑业强 on 2018/10/4.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - enum
typedef NS_ENUM(NSUInteger, SheetMusicTransitionType) {
    SheetMusicTransitionTypePush = 0,
    SheetMusicTransitionTypePop
};

#pragma mark - 声明
@interface SheetMusicTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithTransitionType:(SheetMusicTransitionType)type;
- (instancetype)initWithTransitionType:(SheetMusicTransitionType)type;

@end

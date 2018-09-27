//
//  HomeContent.h
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "HomeConfig.h"


#pragma mark - 代理
@class HomeContent;
@protocol HomeContentDelegate <NSObject>
@optional
- (void)homeContent:(HomeContent *)content progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex;

@end


#pragma mark - 声明
@interface HomeContent : BaseView

@property (nonatomic, strong) HomeConfig *config;
@property (nonatomic, weak  ) id<HomeContentDelegate> delegate;

// 滚动到某一个View
- (void)scrollWithIndex:(NSInteger)index;

@end

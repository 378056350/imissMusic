//
//  HomeTitle.h
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "HomeConfig.h"

#pragma mark - 代理
@class HomeTitle;
@protocol HomeTitleDelegate <NSObject>
@optional
- (void)homeTitle:(HomeTitle *)content selectedIndex:(NSInteger)selectedIndex;

@end


#pragma mark - 声明
@interface HomeTitle : BaseView

@property (nonatomic, strong) HomeConfig *config;
@property (nonatomic, weak  ) id<HomeTitleDelegate> delegate;
@property (nonatomic, assign) NSInteger selectIndex;

- (void)setProgress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex;

@end

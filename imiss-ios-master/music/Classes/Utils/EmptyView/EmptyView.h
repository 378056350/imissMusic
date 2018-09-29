//
//  EmptyView.h
//  imiss
//
//  Created by 郑业强 on 2018/8/13.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - enum
typedef NS_ENUM(NSInteger, EmptyState) {
    EmptyStateNetkFailIcon,          // 网络请求 - 图
    EmptyStateNetkFailPullRefresh,   // 网络请求 - 下拉刷新
    EmptyStateNetkFailButton,        // 网络请求 - 按钮
    EmptyStatePlayRecordNone,        // 无播放记录
    EmptyStateCollectionNone,        // 无收藏歌曲
    EmptyStateLoading,               // 正在加载
};
typedef void (^EmptyViewEventBlock)(void);

#pragma mark - 声明
@interface EmptyView : UIView

@property (nonatomic, assign) EmptyState state;      // 样式
@property (nonatomic, copy  ) EmptyViewEventBlock event;    // 点击

- (void)show;
- (void)hide;

@end

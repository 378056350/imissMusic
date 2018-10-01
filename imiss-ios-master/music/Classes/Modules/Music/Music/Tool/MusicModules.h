//
//  Play.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/14.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "MusicModulesConst.h"
#import "ResourceModel.h"

#pragma mark - NS_ENUM
typedef NS_ENUM(NSUInteger, MusicLyricStatus) {
    MusicLyricStatusPlay,      // 正在播放
    MusicLyricStatusScroll,    // 正在滚动
    MusicLyricStatusScrollEndTimeCount,    // 滚动结束两秒内
};


#pragma mark - 代理
@class MusicModules;
@protocol MusicModulesDelegate<NSObject>

@optional
// 播放失败
- (void)music:(MusicModules *)manager fail:(NSString *)music;
// 播放完成
- (void)music:(MusicModules *)manager finish:(NSString *)music;
// 播放中
- (void)music:(MusicModules *)manager playing:(NSString *)music progress:(CGFloat)progress currentTime:(NSTimeInterval)currentTime totalTime:(NSTimeInterval)totalTime;

@end


#pragma mark - 声明
@interface MusicModules : NSObject
SingleInterface(MusicModules)

@property (nonatomic, weak  ) id<MusicModulesDelegate> delegate;    // 代理
@property (nonatomic, copy  ) NSString *music;                      // 音乐
@property (nonatomic, assign) CGFloat speed;                        // 倍速(0-1)
@property (nonatomic, assign) CGFloat volume;                       // 音量
@property (nonatomic, assign, getter=isPlaying) BOOL playing;       // 是否播放
@property (nonatomic, strong) NSTimer *timer;                       // 定时器
@property (nonatomic, assign) MusicLyricStatus status;              // 状态
@property (nonatomic, copy  ) NSString *musicId;                    // 当前播放ID
@property (nonatomic, strong) ResourceModel *resourceModel;         // 资源model


// 播放
- (void)play;
// 暂停
- (void)pause;
// 重置
- (void)reset;
// 状态变化
- (void)statusChange;

// 当前时间
- (NSTimeInterval)currentTime;
- (void)setCurrentTime:(NSTimeInterval)currentTime;
// 总时间
- (NSTimeInterval)totalTime;


@end

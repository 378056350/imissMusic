//
//  Play.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/14.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicModules.h"

#pragma mark - 声明
@interface MusicModules()<AVAudioPlayerDelegate> {
    // 音乐播放器
    AVAudioPlayer *_player;
}

@end

#pragma mark - 实现
@implementation MusicModules
SingleImplementation(MusicModules)

#pragma mark - get/set
- (instancetype)init {
    if (self = [super init]) {
        [self timer];
    }
    return self;
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(progress:) userInfo:nil repeats:YES];
    }
    return _timer;
}

// 设置音乐
- (void)setMusic:(NSString *)music {
    _music = music;
    // 音乐资源
    NSURL *path = [NSURL URLWithString:music];
    NSData *data;
    if (DEBUG) {
        data = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"后来" ofType:@"mp3"]];
    }
    else {
        data = [[NSData alloc] initWithContentsOfURL:path];
    }
    if (!path && !DEBUG) {
        return;
    }
    // 播放器
//    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:music] error:nil];
    _player = [[AVAudioPlayer alloc] initWithData:data error:nil];
    _player.delegate = self;
    _player.volume = 0.1;
}
// 当前时间
- (void)setCurrentTime:(NSTimeInterval)currentTime {
    _player.currentTime = currentTime;
    [[NSNotificationCenter defaultCenter] postNotificationName:MusicModulesConstProgress object:nil];
}
// 当前时间
- (NSTimeInterval)currentTime {
    NSTimeInterval currentTime = [_player currentTime];
    return currentTime;
}
// 总时间
- (NSTimeInterval)totalTime {
    NSTimeInterval totalTime = [_player duration];
    return totalTime;
}
// 是否播放
- (BOOL)isPlaying {
    return [_player isPlaying];
}

#pragma mark - AVAudioPlayerDelegate, 监听
// 播放结束
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    if (self.delegate && [self.delegate respondsToSelector:@selector(music:finish:)]) {
        [self.delegate music:self finish:_music];
    }
}
// 解码错误执行的动作
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(music:fail:)]) {
        [self.delegate music:self fail:_music];
    }
}
// 进度
- (void)progress:(NSTimer *)sender {
    CGFloat progress = _player.currentTime / _player.duration * 100;
    NSTimeInterval currentTime = _player.currentTime;
    NSTimeInterval totalTime = _player.duration;
    if (self.delegate && [self.delegate respondsToSelector:@selector(music:playing:progress:currentTime:totalTime:)]) {
        [self.delegate music:self playing:_music progress:progress currentTime:currentTime totalTime:totalTime];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:MusicModulesConstProgress object:nil];
}

#pragma mark - 操作
// 播放
- (void)play {
    if (!_player) {
        return;
    }
    // 准备播放
    [_player prepareToPlay];
    // 播放
    [_player play];
    // 通知
    [[NSNotificationCenter defaultCenter] postNotificationName:MusicModulesConstPlay object:nil];
}
// 暂停
- (void)pause {
    [_player pause];
    // 通知
    [[NSNotificationCenter defaultCenter] postNotificationName:MusicModulesConstPause object:nil];
}
// 重置
- (void)reset {
    [_player stop];
    _player.currentTime = 0;
    // 通知
    [[NSNotificationCenter defaultCenter] postNotificationName:MusicModulesConstReset object:nil];
}
// 状态变化
- (void)statusChange {
    if (_player.isPlaying == YES) {
        [self pause];
    }
    else {
        [self play];
    }
}

@end

//
//  MusicController.h
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseViewController.h"
#import "MusicNavigation.h"
#import "MusicCD.h"
#import "MusicBottom.h"
#import "MusicLyric.h"
#import "SongModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MusicController : BaseViewController

@property (nonatomic, strong) MusicNavigation *navigation;
@property (nonatomic, strong) MusicCD *cd;
@property (nonatomic, strong) MusicLyric *lyric;
@property (nonatomic, strong) MusicBottom *bottom;

@property (nonatomic, strong) SongModel *model;

- (void)show;
- (void)hide;

// 显示CD/歌词
- (void)showCD:(BOOL)isShowCD
       duation:(NSTimeInterval)duration
    completion:(void (^ __nullable)(BOOL finished))completion;

@end

NS_ASSUME_NONNULL_END

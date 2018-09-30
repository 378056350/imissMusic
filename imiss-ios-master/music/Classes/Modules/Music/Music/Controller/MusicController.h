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

NS_ASSUME_NONNULL_BEGIN

@interface MusicController : BaseViewController

@property (nonatomic, strong) MusicNavigation *navigation;
@property (nonatomic, strong) MusicCD *cd;
@property (nonatomic, strong) MusicLyric *lyric;
@property (nonatomic, strong) MusicBottom *bottom;

- (void)show;
- (void)hide;

@end

NS_ASSUME_NONNULL_END

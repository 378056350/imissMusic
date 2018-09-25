//
//  PlayItem.m
//  imiss
//
//  Created by MAC on 2018/8/29.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicItem.h"
#import "MusicItemConst.h"

#pragma mark - 声明
@interface MusicItem () {
    // 个数
    NSInteger _number;
}

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) MusicItemConst *manager;

@end

#pragma mark - 实现
@implementation MusicItem

- (void)initUI {
    _number = 1;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopMusic) name:MusicItemEndMusic object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startMusic) name:MusicItemStartMusic object:nil];
    __weak typeof(self) weak = self;
    [self setImage:[UIImage imageNamed:@"cm2_list_loading1"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"cm2_list_loading1"] forState:UIControlStateHighlighted];
    [self sizeToFit];
    [self addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        if (weak.click) {
            weak.click();
        }
    }];
    
    if (self.manager.playing == YES) {
        [[NSNotificationCenter defaultCenter] postNotificationName:MusicItemStartMusic object:nil];
    }
}

#pragma mark - 操作
// 开始播放
- (void)startMusic {
    if (!_timer) {
        // 参数
        MusicItemConst *shareManager = [MusicItemConst shareMusicItemConst];
        shareManager.playing = YES;
        // 切换图片
        __weak typeof(self) weak = self;
        _timer = [NSTimer scheduledTimerWithTimeInterval:.2f repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSString *image = [NSString stringWithFormat:@"cm2_list_loading%ld", _number];
            [weak setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
            [weak setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
            _number += 1;
            if (_number > 4) {
                _number = 1;
            }
        }];
    }
}
// 停止播放
- (void)stopMusic {
    if (_timer) {
        // 参数
        MusicItemConst *shareManager = [MusicItemConst shareMusicItemConst];
        shareManager.playing = NO;
        // 停止定时
        [_timer invalidate];
    }
}

#pragma mark - get
- (instancetype)init {
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (MusicItemConst *)manager {
    if (!_manager) {
        _manager = [MusicItemConst shareMusicItemConst];
    }
    return _manager;
}
- (UIBarButtonItem *)getBarItem {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self];
    return item;
}

@end

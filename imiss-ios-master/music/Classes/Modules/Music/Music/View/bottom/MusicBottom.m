//
//  MusicBottom.m
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicBottom.h"

#pragma mark - 声明
@interface MusicBottom() {
    // 是否在滚动
    BOOL _isScroll;
}

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *leftLab;
@property (weak, nonatomic) IBOutlet UILabel *rightLab;
@property (nonatomic, strong) MusicModules *module;

@end

#pragma mark - 实现
@implementation MusicBottom

- (void)initUI {
    [self setBackgroundColor:[UIColor clearColor]];
    [self.leftLab setFont:MathFont(12)];
    [self.rightLab setFont:MathFont(12)];
    [self.leftLab setTextColor:kColor_Text_Gary];
    [self.rightLab setTextColor:kColor_Text_Gary];
    [self.slider setThumbImage:[UIImage new] forState:UIControlStateNormal];
    [self.controlImg setAlpha:0];
    
    [self.cycleBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.randomBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.leftBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.rightBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    [self.cycleBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [self.randomBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [self.leftBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [self.rightBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [self.listBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 15, 10, 15)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(musicPlay) name:MusicModulesConstPlay object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(musicPause) name:MusicModulesConstPause object:nil];
    
}


#pragma mark - 点击
// 播放/暂停点击
- (IBAction)controlClick:(UITapGestureRecognizer *)sender {
    // 播放中
    if ([self.module isPlaying]) {
        // 暂停
        [self.module pause];
    }
    // 暂停
    else {
        // 播放
        [self.module play];
    }
}

#pragma mark - 控制
// 获取时间字符串 通过 秒数
- (NSString *)getTimeWithSecond:(NSTimeInterval)sec {
    NSInteger minute = (NSInteger)sec / 60;
    NSInteger second = (NSInteger)sec % 60;
    return [NSString stringWithFormat:@"%02ld:%02ld", minute, second];
}
// 播放中
- (void)music:(MusicModules *)manager playing:(NSString *)music progress:(CGFloat)progress currentTime:(NSTimeInterval)currentTime totalTime:(NSTimeInterval)totalTime {
    [self.rightLab setText:[self getTimeWithSecond:totalTime]];
    [self.slider setMinimumValue:0];
    [self.slider setMaximumValue:totalTime];
    
    if (_isScroll == NO) {
        self.leftLab.text = [self getTimeWithSecond:currentTime];
        self.slider.value = currentTime;
    }
}

#pragma mark - get
// 控制
- (MusicModules *)module {
    if (!_module) {
        _module = [MusicModules shareMusicModules];
    }
    return _module;
}

#pragma mark - 控制
// 音乐播放
- (void)musicPlay {
    [self.controlImg setImage:[UIImage imageNamed:@"home_pause"]];
}
// 音乐暂停
- (void)musicPause {
    [self.controlImg setImage:[UIImage imageNamed:@"home_play"]];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

//
//  MusicBottom.m
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicBottom.h"

#pragma mark - 声明
@interface MusicBottom()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *leftLab;
@property (weak, nonatomic) IBOutlet UILabel *rightLab;

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
    
}

@end

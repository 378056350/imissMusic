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
    
    [self.cycleBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.randomBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.leftBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.rightBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    [self.cycleBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [self.randomBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [self.leftBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [self.rightBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [self.listBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 15, 10, 15)];
    
}

@end

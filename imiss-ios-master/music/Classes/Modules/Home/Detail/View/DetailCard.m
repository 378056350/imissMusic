//
//  DetailCard.m
//  music
//
//  Created by zhongke on 2018/9/29.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DetailCard.h"

#pragma mark - 声明
@interface DetailCard()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@property (weak, nonatomic) IBOutlet UILabel *contentDescLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;

@end

#pragma mark - 实现
@implementation DetailCard

- (void)initUI {
    self.nameLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.nameLab.textColor = kColor_Text_Black;
    self.detailLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.detailLab.textColor = kColor_Text_Gary;
    self.contentDescLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.contentDescLab.textColor = kColor_Text_Black;
    self.contentLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.contentLab.textColor = kColor_Text_Gary;
    
    self.icon.alpha = 0;
    self.nameLab.alpha = 0;
    self.detailLab.alpha = 0;
    self.contentDescLab.alpha = 0;
    self.contentLab.alpha = 0;
}

#pragma mark - 动画
- (void)show {
    self.icon.top += 10;
    self.nameLab.top += 10;
    self.detailLab.top += 10;
    self.contentDescLab.top += 10;
    [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.icon.alpha = 1;
        self.nameLab.alpha = 1;
        self.detailLab.alpha = 1;
        self.contentDescLab.alpha = 1;
        self.contentLab.alpha = 1;
        self.icon.top -= 10;
        self.nameLab.top -= 10;
        self.detailLab.top -= 10;
        self.contentDescLab.top -= 10;
    } completion:^(BOOL finished) {
        
    }];
    
    
    // 专辑 - 位置
    POPBasicAnimation *contentBasic = ({
        CGRect rect = self.contentLab.frame;
        self.contentLab.top += self.contentLab.height;
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.duration = 1.0f;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
        basic;
    });
    [self.contentLab pop_addAnimation:contentBasic forKey:@"contentBasic"];
    
    
}
- (void)hide {
    
}

@end

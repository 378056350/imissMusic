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

@end

#pragma mark - 实现
@implementation DetailCard

- (void)initUI {
    self.iconImg.alpha = 0;
    self.nameLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.nameLab.textColor = kColor_Text_Black;
    self.nameLab.alpha = 0;
    self.detailLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.detailLab.textColor = kColor_Text_Gary;
    self.detailLab.alpha = 0;
    self.contentDescLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.contentDescLab.textColor = kColor_Text_Black;
    self.contentDescLab.alpha = 0;
    self.contentLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.contentLab.textColor = kColor_Text_Gary;
    self.contentLab.alpha = 0;
    
    NSMutableString *strm = [[NSMutableString alloc] init];
    for (int i=0; i<100; i++) {
        [strm appendString:@"奥术大师大所大"];
    }
    self.contentLab.attributedText = ({
        
        
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:strm attributes:({
            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
            style.lineSpacing = 5;
            NSDictionary *attributes = @{NSParagraphStyleAttributeName: style,
                                         NSFontAttributeName: [UIFont systemFontOfSize:AdjustFont(14)],
                                         NSForegroundColorAttributeName: [UIColor redColor]
                                         };
            attributes;
        })];
        attr;
    });
    
    
    CGSize size = [strm sizeWithMaxSize:CGSizeMake(self.width - 30, MAXFLOAT) font:[UIFont systemFontOfSize:AdjustFont(14)] lineHeight:5];
    
    [self setClipsToBounds:YES];
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:5];
    [self.maskView.layer setMask:[self greenHeadMaskLayer]];
    [self.scroll addSubview:self.scrollContentView];
    [self.scroll setContentSize:CGSizeMake(0, CGRectGetMaxY(self.contentLab.frame) + 15)];
    [self.scroll setContentSize:CGSizeMake(0, self.contentLab.top + size.height + 30)];
    [self.scrollContentView setFrame:self.bounds];
}

- (CALayer *)greenHeadMaskLayer {
    CALayer *mask = [CALayer layer];
    mask.frame = self.contentLab.bounds;
    
    CAShapeLayer *maskLayerUp = [CAShapeLayer layer];
    maskLayerUp.fillColor = [UIColor greenColor].CGColor;
    maskLayerUp.path = [UIBezierPath bezierPathWithRect:self.contentLab.bounds].CGPath;
    maskLayerUp.opacity = 0.8f;
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[[UIColor redColor] colorWithAlphaComponent:1.0].CGColor,
                             (__bridge id)[[UIColor redColor] colorWithAlphaComponent:1.0].CGColor,
                             (__bridge id)[[UIColor redColor] colorWithAlphaComponent:0.0].CGColor];
    gradientLayer.locations = @[@0.0, @0.8, @1.0];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1.0);
    gradientLayer.frame = CGRectMake(0, 0, self.maskView.width, self.maskView.height - 25);
    [mask addSublayer:gradientLayer];
    
    return mask;
}

#pragma mark - 动画
- (void)show {
    self.iconImg.top += 10;
    self.nameLab.top += 10;
    self.detailLab.top += 10;
    self.contentDescLab.top += 10;
    [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.iconImg.alpha = 1;
        self.nameLab.alpha = 1;
        self.detailLab.alpha = 1;
        self.contentDescLab.alpha = 1;
        self.contentLab.alpha = 1;
        self.iconImg.top -= 10;
        self.nameLab.top -= 10;
        self.detailLab.top -= 10;
        self.contentDescLab.top -= 10;
    } completion:^(BOOL finished) {
        
    }];
    
    
    // 专辑 - 位置
    POPSpringAnimation *contentBasic = ({
        CGRect rect = self.contentLab.frame;
        self.contentLab.top += self.contentLab.height;
        POPSpringAnimation *basic = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.springSpeed = 1;
        basic.springBounciness = 1;
        basic.dynamicsTension = 50;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
        basic;
    });
    [self.contentLab pop_addAnimation:contentBasic forKey:@"contentBasic"];
    
    
}
- (void)hide {
    
}

@end

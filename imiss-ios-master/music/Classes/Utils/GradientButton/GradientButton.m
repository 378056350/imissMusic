//
//  GradientButton.m
//  imiss
//
//  Created by MAC on 2018/8/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "GradientButton.h"

#pragma mark - 声明
@interface GradientButton ()

@end

#pragma mark - 实现
@implementation GradientButton

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    UIImage *normal = [self createGradientLayer:MainColor color2:MainColor_Black];
    UIImage *highlet = [self createGradientLayer:HexColor(@"#c32525") color2:HexColor(@"#8e1b1b")];
    
    [self.titleLabel setFont:NORMAL_FONT(16)];
    
    [self setBackgroundImage:normal forState:UIControlStateNormal];
    [self setBackgroundImage:highlet forState:UIControlStateHighlighted];
    
    [self.layer setCornerRadius:self.height / 2];
    [self.layer setMasksToBounds:YES];
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5] forState:UIControlStateDisabled];
}
- (UIImage *)createGradientLayer:(UIColor *)color1 color2:(UIColor *)color2 {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(0, self.height, self.width, self.height);
    layer.colors = @[(__bridge id)color1.CGColor, (__bridge id)color2.CGColor];
    layer.locations = @[@0.0, @1.0];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1.0, 0);
    [self.layer addSublayer:layer];
    return [layer imageFromView];
}


@end

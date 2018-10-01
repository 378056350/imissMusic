//
//  SheetCollectionCell.m
//  music
//
//  Created by zhongke on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SheetCollectionCell.h"

#pragma mark - 声明
@interface SheetCollectionCell()

@end

#pragma mark - 实现
@implementation SheetCollectionCell

- (void)initUI {
    self.clipsToBounds = NO;
    self.cd.layer.cornerRadius = 80 / 2.f;
    self.cd.layer.masksToBounds = YES;
}
- (void)show:(BOOL)animation {
    NSTimeInterval time = animation == YES ? 0.3f : 0;
    [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.cd.left = 10;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)hide:(BOOL)animation {
    NSTimeInterval time = animation == YES ? 0.3f : 0;
    [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.cd.left = 0;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)setModel:(SheetModel *)model {
    _model = model;
    if (DEBUG) {
        self.icon.image = [UIImage imageNamed:model.img];
    }
}

@end

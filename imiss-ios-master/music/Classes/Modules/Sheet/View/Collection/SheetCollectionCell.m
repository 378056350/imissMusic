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

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@end

#pragma mark - 实现
@implementation SheetCollectionCell

- (void)initUI {
    self.icon.backgroundColor = [UIColor redColor];
    self.layer.anchorPoint = CGPointMake(0, 0.5);
}

@end

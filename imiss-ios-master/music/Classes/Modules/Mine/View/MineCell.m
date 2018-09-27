//
//  MineCell.m
//  music
//
//  Created by zhongke on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MineCell.h"

#pragma mark - 声明
@interface MineCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameConstraintL;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

#pragma mark - 实现
@implementation MineCell

- (void)initUI {
    self.backgroundColor = kColor_BG;
    self.nameConstraintL.constant = countcoordinatesX(15);
    self.name.font = [UIFont systemFontOfSize:AdjustFont(16)];
    self.name.textColor = kColor_Text_Gary;
}

@end


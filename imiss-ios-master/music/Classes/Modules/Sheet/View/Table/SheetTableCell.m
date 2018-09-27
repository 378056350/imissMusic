//
//  SheetTableCell.m
//  music
//
//  Created by zhongke on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SheetTableCell.h"

#pragma mark - 声明
@interface SheetTableCell()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end

#pragma mark - 实现
@implementation SheetTableCell

- (void)initUI {
    self.backgroundColor = [UIColor clearColor];
    self.name.font = [UIFont systemFontOfSize:AdjustFont(16)];
    self.detail.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.time.font = [UIFont systemFontOfSize:AdjustFont(14)];
    
    self.name.textColor = kColor_Text_Black;
    self.detail.textColor = kColor_Text_Gary;
    self.time.textColor = kColor_Text_Gary;
    
}

@end

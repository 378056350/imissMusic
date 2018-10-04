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

@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconConstraintL;

@end

#pragma mark - 实现
@implementation SheetTableCell

- (void)initUI {
    self.backgroundColor = [UIColor clearColor];
    self.name.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.detail.font = [UIFont systemFontOfSize:AdjustFont(12)];
    self.time.font = [UIFont systemFontOfSize:AdjustFont(12)];
    
    self.name.textColor = kColor_Text_Black;
    self.detail.textColor = kColor_Text_Gary;
    self.time.textColor = kColor_Text_Gary;
    self.iconConstraintL.constant = countcoordinatesX(10);
    
    
    self.name.allowNight = YES;
    self.detail.allowNight = YES;
    self.time.allowNight = YES;
    self.allowNight = YES;
    self.contentView.allowNight = YES;
}

- (void)setModel:(SongModel *)model {
    _model = model;
    if (DEBUG) {
        [self.icon setImage:[UIImage imageNamed:model.small_img]];
    }
    else {
        [self.icon sd_setImageWithURL:[NSURL URLWithString:KStatic(model.small_img)]];
    }
    [self.name setText:model.name];
    [self.detail setText:model.introduction];
}

@end





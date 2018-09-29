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
@property (weak, nonatomic) IBOutlet UISwitch *sw;
@property (weak, nonatomic) IBOutlet UIImageView *next;

@end

#pragma mark - 实现
@implementation MineCell

- (void)initUI {
    self.backgroundColor = kColor_BG;
    self.nameConstraintL.constant = countcoordinatesX(15);
    self.name.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.name.textColor = kColor_Text_Gary;
}

#pragma mark - set
- (void)setStatus:(MineCellStatus)status {
    _status = status;
    if (status == MineCellStatusSwitch) {
        _sw.hidden = NO;
        _next.hidden = YES;
    }
    else if (status == MineCellStatusNext) {
        _sw.hidden = YES;
        _next.hidden = NO;
    }
}
- (void)setIndex:(NSIndexPath *)index {
    _index = index;
    
    if (index.section == 0) {
        // 锁屏歌词
        if (index.row == 0) {
            self.status = MineCellStatusSwitch;
        }
        // 夜间模式
        else if (index.row == 1) {
            self.status = MineCellStatusSwitch;
        }
    }
    else if (index.section == 1) {
        // 截屏后提示分享
        if (index.row == 0) {
            self.status = MineCellStatusSwitch;
        }
        // 寻找并邀请好友
        else if (index.row == 1) {
            self.status = MineCellStatusNext;
        }
        // 分享imiss 
        else if (index.row == 2) {
            self.status = MineCellStatusNext;
        }
        // 关于
        else if (index.row == 3) {
            self.status = MineCellStatusNext;
        }
    }
}

@end


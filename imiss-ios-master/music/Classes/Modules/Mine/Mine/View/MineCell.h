//
//  MineCell.h
//  music
//
//  Created by zhongke on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseTableCell.h"

#pragma mark - NS_ENUM
typedef NS_ENUM(NSUInteger, MineCellStatus) {
    MineCellStatusSwitch,
    MineCellStatusNext,
};

#pragma mark - 声明
@interface MineCell : BaseTableCell

@property (nonatomic, assign) MineCellStatus status;
@property (nonatomic, strong) NSIndexPath *index;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end


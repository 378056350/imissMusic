//
//  SheetTableCell.h
//  music
//
//  Created by zhongke on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseTableCell.h"
#import "SongModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SheetTableCell : BaseTableCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *detail;

@property (nonatomic, strong) SongModel *model;

@end

NS_ASSUME_NONNULL_END

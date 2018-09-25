//
//  KKSheetCell.h
//  imiss
//
//  Created by 郑业强 on 2018/9/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseTableCell.h"

#pragma mark - 声明
@interface KKSheetCell : BaseTableCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (nonatomic, assign) BOOL enable;

@end

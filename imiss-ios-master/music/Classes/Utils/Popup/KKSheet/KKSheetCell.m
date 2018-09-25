//
//  KKSheetCell.m
//  imiss
//
//  Created by 郑业强 on 2018/9/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKSheetCell.h"

#pragma mark - 声明
@interface KKSheetCell()

@end

#pragma mark - 实现
@implementation KKSheetCell

- (void)initUI {
    [self setEnable:YES];
    [self.name setFont:[UIFont systemFontOfSize:AdjustFont(12)]];
    [self.name setTextColor:kColor_Text_Gary];
}
- (void)setEnable:(BOOL)enable {
    _enable = enable;
    if (enable == YES) {
        self.icon.alpha = 1;
        self.name.alpha = 1;
    }
    else {
        self.icon.alpha = 0.5;
        self.name.alpha = 0.5;
    }
}

@end

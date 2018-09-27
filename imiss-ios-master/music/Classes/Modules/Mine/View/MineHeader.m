//
//  MineHeader.m
//  music
//
//  Created by zhongke on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MineHeader.h"

#pragma mark - 声明
@interface MineHeader()

@property (nonatomic, strong) UILabel *name;

@end

#pragma mark - 实现
@implementation MineHeader

- (void)initUI {
    self.backgroundColor = [UIColor clearColor];
    [self name];
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] initWithFrame:CGRectMake(countcoordinatesX(15), 0, SCREEN_WIDTH, self.height)];
        _name.textColor = kColor_Text_Gary;
        _name.attributedText = [NSAttributedString shadowAttrString:@"Mine" color:kColor_Text_Gary fontSize:16 alignment:NSTextAlignmentLeft];
        [self addSubview:_name];
    }
    return _name;
}

@end

//
//  AboutController.m
//  music
//
//  Created by 郑业强 on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "AboutController.h"

#pragma mark - 声明
@interface AboutController()

@property (nonatomic, strong) KKHeaderView *header;
@property (nonatomic, strong) UILabel *name;

@end

#pragma mark - 实现
@implementation AboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self header];
    [self name];
}
- (KKHeaderView *)header {
    if (!_header) {
        _header = [KKHeaderView loadCode:CGRectZero];
        _header.name = @"About";
        [self.view addSubview:_header];
    }
    return _header;
}
- (UILabel *)name {
    if (!_name) {
        UIFont *font = [UIFont systemFontOfSize:AdjustFont(12)];
        NSString *str = @"没什么好说的, 要是有问题可以联系我: 378056350";
        
        _name = [[UILabel alloc] initWithFrame:CGRectMake(countcoordinatesX(15), CGRectGetMaxY(self.header.frame), SCREEN_WIDTH - countcoordinatesX(30), SCREEN_HEIGHT - CGRectGetMaxY(self.header.frame))];
        [_name setFont:font];
        [_name setTextColor:kColor_Text_Gary];
        [_name setNumberOfLines:0];
        [_name setAttributedText:({
            NSAttributedString *attr = [[NSAttributedString alloc] initWithString:str attributes:({
                NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
                style.lineSpacing = 5;
                NSDictionary *attributes = @{NSParagraphStyleAttributeName: style,
                                             NSFontAttributeName: font,
                                             NSForegroundColorAttributeName: kColor_Text_Gary
                                             };
                attributes;
            })];
            attr;
        })];
        [_name setHeight:[str sizeWithMaxSize:CGSizeMake(_name.width, MAXFLOAT) font:font lineHeight:5].height];
        
        [self.view addSubview:_name];
    }
    return _name;
}

@end

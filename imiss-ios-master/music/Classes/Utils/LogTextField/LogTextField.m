//
//  LogTextField.m
//  imiss
//
//  Created by MAC on 2018/8/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "LogTextField.h"

#pragma mark - 声明
@interface LogTextField ()

@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *phoneConstraintW;
@property (weak, nonatomic) IBOutlet UIView *line;

@end

#pragma mark - 实现
@implementation LogTextField

- (void)initUI {
    _phone.font = NORMAL_FONT(14);
    _textField.font = NORMAL_FONT(14);
    _phone.themeMap = @{
                        kThemeKeyLightTitleNormalColor: kColor_Text_Black,
                        kThemeKeyNightTitleNormalColor: kColor_Text_Light
                        };
    _textField.themeMap = @{
                                kThemeKeyLightTitleNormalColor: kColor_Text_Black,
                                kThemeKeyLightPlaceholderColor: kColor_Text_Light,
                                kThemeKeyNightTitleNormalColor: kColor_Text_Light,
                                kThemeKeyNightPlaceholderColor: kColor_Text_Gary
                                };
    _line.themeMap = @{
                       kThemeKeyLightBackNormalColor: kColor_BG,
                       kThemeKeyNightBackNormalColor: kColor_Text_Black
                       };
}

// 是否隐藏电话图标
- (void)setHiddenPhone:(BOOL)hiddenPhone {
    _hiddenPhone = hiddenPhone;
    if (hiddenPhone == YES) {
        _phoneConstraintW.constant = 0;
        _phone.hidden = YES;
    }
    else {
        _phoneConstraintW.constant = 35;
        _phone.hidden = NO;
    }
}

@end

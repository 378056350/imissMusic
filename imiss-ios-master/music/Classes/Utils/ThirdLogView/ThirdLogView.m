//
//  ThirdLogView.m
//  imiss
//
//  Created by 郑业强 on 2018/8/14.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ThirdLogView.h"

#pragma mark - 声明
@interface ThirdLogView()

@property (weak, nonatomic) IBOutlet UIView *line1;
@property (weak, nonatomic) IBOutlet UIView *line2;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIButton *weiIcon;
@property (weak, nonatomic) IBOutlet UIButton *qqIcon;
@property (weak, nonatomic) IBOutlet UIButton *sinaIcon;
@property (weak, nonatomic) IBOutlet UILabel *weiName;
@property (weak, nonatomic) IBOutlet UILabel *qqName;
@property (weak, nonatomic) IBOutlet UILabel *sinaName;

@end

#pragma mark - 实现
@implementation ThirdLogView

- (void)initUI {
    _line1.backgroundColor = kColor_Text_Gary;
    _line2.backgroundColor = kColor_Text_Gary;
    _name.textColor = kColor_Text_Gary;
    _name.font = NORMAL_FONT(12);
    _weiName.font = ITALIC_FONT(12);
    _qqName.font = ITALIC_FONT(12);
    _sinaName.font = ITALIC_FONT(12);
    if ([TimeTool isNight]) {
        _weiName.textColor = kColor_BG;
        _qqName.textColor = kColor_BG;
        _sinaName.textColor = kColor_BG;
        [_weiIcon setImage:[UIImage imageNamed:@"cm2_login_btn_weixin_night"] forState:UIControlStateNormal];
        [_weiIcon setImage:[UIImage imageNamed:@"cm2_login_btn_weixin_night_prs"] forState:UIControlStateHighlighted];
        [_qqIcon setImage:[UIImage imageNamed:@"cm2_login_btn_qq_night"] forState:UIControlStateNormal];
        [_qqIcon setImage:[UIImage imageNamed:@"cm2_login_btn_qq_night_prs"] forState:UIControlStateHighlighted];
        [_sinaIcon setImage:[UIImage imageNamed:@"cm2_login_btn_sina_night"] forState:UIControlStateNormal];
        [_sinaIcon setImage:[UIImage imageNamed:@"cm2_login_btn_sina_night_prs"] forState:UIControlStateHighlighted];
    }
    else {
        _weiName.textColor = kColor_Text_Gary;
        _qqName.textColor = kColor_Text_Gary;
        _sinaName.textColor = kColor_Text_Gary;
        [_weiIcon setImage:[UIImage imageNamed:@"cm2_login_btn_weixin"] forState:UIControlStateNormal];
        [_weiIcon setImage:[UIImage imageNamed:@"cm2_login_btn_weixin_prs"] forState:UIControlStateHighlighted];
        [_qqIcon setImage:[UIImage imageNamed:@"cm2_login_btn_qq"] forState:UIControlStateNormal];
        [_qqIcon setImage:[UIImage imageNamed:@"cm2_login_btn_qq_prs"] forState:UIControlStateHighlighted];
        [_sinaIcon setImage:[UIImage imageNamed:@"cm2_login_btn_sina"] forState:UIControlStateNormal];
        [_sinaIcon setImage:[UIImage imageNamed:@"cm2_login_btn_sina_prs"] forState:UIControlStateHighlighted];
    }
}

- (IBAction)shareClick:(UIButton *)sender {
    if (_event) {
        _event(sender.tag);
    }
}

@end

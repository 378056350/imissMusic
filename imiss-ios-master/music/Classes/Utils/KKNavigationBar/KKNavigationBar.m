//
//  KKNavigationBar.m
//  imiss
//
//  Created by MAC on 2018/8/31.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKNavigationBar.h"

#pragma mark - 声明
@interface KKNavigationBar ()

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;

@end

#pragma mark - 实现
@implementation KKNavigationBar

- (void)initUI {
    [self.titleLab setFont:[UIFont systemFontOfSize:AdjustFont(14)]];
    [self.titleLab setTextColor:kColor_White];
    [self.nameLab setFont:[UIFont systemFontOfSize:AdjustFont(14)]];
    [self.nameLab setTextColor:kColor_White];
    [self.detailLab setFont:[UIFont systemFontOfSize:AdjustFont(12)]];
    [self.detailLab setTextColor:kColor_White];
    [self.leftBtn setAlpha:1];
    [self.rightBtn setAlpha:1];
    
    [self.leftBtn setImage:[UIImage imageNamed:@"cm2_live_btn_back"] forState:UIControlStateNormal];
    [self.leftBtn setImage:[UIImage imageNamed:@"cm2_live_btn_back_prs"] forState:UIControlStateHighlighted];
    [self.leftBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.leftBtn sizeToFit];
    [self setStatus:KKNavigationBarStatusTwo];
}

#pragma mark - set
// 样式
- (void)setStatus:(KKNavigationBarStatus)status {
    _status = status;
    // 一行
    if (status == KKNavigationBarStatusOne) {
        self.nameLab.hidden = YES;
        self.detailLab.hidden = YES;
        self.titleLab.hidden = NO;
    }
    // 二行
    else if (status == KKNavigationBarStatusTwo) {
        self.nameLab.hidden = NO;
        self.detailLab.hidden = NO;
        self.titleLab.hidden = YES;
    }
}

#pragma mark - 点击
- (IBAction)leftClick:(UIButton *)sender {
    if (_leftClick) {
        _leftClick();
    }
    else {
        [self.viewController.navigationController popViewControllerAnimated:YES];
    }
}
- (IBAction)rightClick:(UIButton *)sender {
    if (_rightClick) {
        _rightClick();
    }
}

#pragma mark - set
- (void)setName:(NSString *)name {
    _name = name;
    _nameLab.text = name;
}
- (void)setTitle:(NSString *)title {
    _title = title;
    _titleLab.text = title;
}
- (void)setDetail:(NSString *)detail {
    _detail = detail;
    _detailLab.text = detail;
}


@end

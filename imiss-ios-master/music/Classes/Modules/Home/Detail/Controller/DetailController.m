//
//  DetailController.m
//  music
//
//  Created by 郑业强 on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DetailController.h"

#define BTN_W 30
#define BTN_PADDING countcoordinatesX(20)

#pragma mark - 声明
@interface DetailController()

@property (nonatomic, strong) UIView *contentV;
@property (nonatomic, strong) NSMutableArray<UIButton *> *btns;

@end

#pragma mark - 实现
@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self contentV];
    [self btns];
}

#pragma mark - get
- (UIView *)contentV {
    if (!_contentV) {
        _contentV = [[UIView alloc] initWithFrame:({
            CGFloat left = countcoordinatesX(20);
            CGFloat width = (SCREEN_WIDTH - left * 2);
            CGFloat height = width / 280.f * 380;
            CGFloat top = (SCREEN_HEIGHT - BTN_PADDING - BTN_W - height) / 2;
            CGRectMake(left, top, width, height);
        })];
        _contentV.backgroundColor = [UIColor redColor];
        [self.view addSubview:_contentV];
    }
    return _contentV;
}
- (NSMutableArray<UIButton *> *)btns {
    if (!_btns) {
        _btns = [[NSMutableArray alloc] init];
        for (int i=0; i<3; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:({
                CGFloat width = BTN_W;
                CGFloat height = BTN_W;
                CGFloat left = self.contentV.centerX - width / 2 + (width + BTN_PADDING) * (i - 1);
                CGFloat top = CGRectGetMaxY(self.contentV.frame) + 20;
                CGRectMake(left, top, width, height);
            })];
            [btn.layer setCornerRadius:btn.height / 2];
            [btn.layer setMasksToBounds:NO];
            [btn.layer setShadowColor:[kColor_Text_Light colorWithAlphaComponent:0.3].CGColor];
            [btn.layer setShadowOffset:CGSizeMake(0, 3)];
            [btn.layer setShadowOpacity:1];
            [btn.layer setShadowRadius:5];
            [btn setBackgroundColor:[UIColor redColor]];
            [self.view addSubview:btn];
            [_btns addObject:btn];
        }
    }
    return _btns;
}

@end

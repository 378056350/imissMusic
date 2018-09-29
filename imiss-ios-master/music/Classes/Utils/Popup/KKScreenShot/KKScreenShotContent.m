//
//  KKScreenShotContent.m
//  music
//
//  Created by zhongke on 2018/9/29.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKScreenShotContent.h"

#define TITLE_TAG 9
#define SHARE_TAG 10

#pragma mark - 声明
@interface KKScreenShotContent()

@property (weak, nonatomic) IBOutlet UIView *content;

@end

#pragma mark - 实现
@implementation KKScreenShotContent

- (void)initUI {
    [self makeUISetting:self];
    [self.content.layer setCornerRadius:5];
    [self.content.layer setMasksToBounds:YES];
    [self setHeight:CGRectGetMaxY(_closeBtn.frame) + countcoordinatesX(20)];
    [self setCenter:CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 70)];
}

// 设置文本字体.颜色
- (void)makeUISetting:(UIView *)view {
    for (id obj in view.subviews) {
        if ([obj isKindOfClass:[UILabel class]]) {
            if ([obj tag] == SHARE_TAG) {
                UILabel *lab = obj;
                lab.font = [UIFont systemFontOfSize:AdjustFont(10) weight:UIFontWeightLight];
                lab.textColor = kColor_Text_Black;
            }
            else if ([obj tag] == TITLE_TAG) {
                UILabel *lab = obj;
                lab.font = [UIFont systemFontOfSize:AdjustFont(12) weight:UIFontWeightLight];
                lab.textColor = kColor_Text_Black;
            }
        }
        else if ([obj isKindOfClass:[UIView class]]) {
            [self makeUISetting:obj];
        }
    }
}

// 事件响应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isKindOfClass:[self class]]) {
        return nil;
    }
    return view;
}

@end

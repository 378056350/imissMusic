/**
 * 弹出框父控件
 * @author 郑业强 2018-06-14
 */

#import "KKPopupView.h"
#import "UIView+BorderLine.h"

#pragma mark - 声明
@interface KKPopupView ()

@end

#pragma mark - 实现
@implementation KKPopupView

#pragma mark - 初始化
+ (instancetype)init {
    NSString *name = NSStringFromClass(self);
    KKPopupView *view = [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil].firstObject;
    [view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [view shadow];
    return view;
}
- (UIButton *)shadow {
    if (!_shadow) {
        _shadow = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shadow setAlpha:0];
        [_shadow setBackgroundColor:[UIColor blackColor]];
        [_shadow setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [_shadow addTarget:self action:@selector(shadowClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_shadow];
    }
    return _shadow;
}

#pragma mark - 点击
// 点击阴影
- (void)shadowClick {
    [self hide];
}

#pragma mark - 设置
- (void)setContent:(UIView *)content {
    _content = content;
    if (_style == KKPopupStyleBottom) {
        [_content shadowWithColor:kColor_Text_Gary offset:CGSizeMake(0, -3) opacity:0.1 radius:1];
    }
    else if (_style == KKPopupStylePopup) {
        [_content shadowWithColor:kColor_Text_Gary offset:CGSizeMake(1, 1) opacity:0.1 radius:1];
    }
}
- (void)setCanClickShadow:(BOOL)canClickShadow {
    _canClickShadow = canClickShadow;
    _shadow.userInteractionEnabled = canClickShadow;
}

#pragma mark - 动画
// 显示
- (void)show {
    [self show:nil];
}
- (void)show:(void (^)(void))animations {
    [self show:animations completion:nil];
}
- (void)show:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion {
    [self.shadow setAlpha:0];
    [self.content setAlpha:0];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    __weak typeof(self) weak = self;
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (animations) {
            animations();
        }
        [weak.shadow setAlpha:0.3];
        [weak.content setAlpha:1];
        // 底部
        if (_style == KKPopupStyleBottom) {
            [weak.content setTop:SCREEN_HEIGHT - weak.content.height];
        }
        // 弹出
        else if (_style == KKPopupStylePopup) {
            [weak.content setAlpha:1];
        }
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
// 隐藏
- (void)hide {
    [self hide:nil];
}
- (void)hide:(void (^)(void))animations {
    [self hide:animations completion:nil];
}
- (void)hide:(void (^)(void))animations completion :(void (^ __nullable)(BOOL finished))completion {
    __weak typeof(self) weak = self;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (animations) {
            animations();
        }
        [weak.shadow setAlpha:0];
        // 底部
        if (_style == KKPopupStyleBottom) {
            [weak.content setTop:SCREEN_HEIGHT];
        }
        // 弹出
        else if (_style == KKPopupStylePopup) {
            [weak.content setAlpha:0];
        }
    } completion:^(BOOL finished) {
        [weak removeFromSuperview];
        if (completion) {
            completion(finished);
        }
    }];
}


@end

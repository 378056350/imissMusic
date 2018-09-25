//
//  BaseView+MBProgressHUD.m
//  imiss
//
//  Created by MAC on 2018/8/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "UIWindow+MBProgressHUD.h"
#import <objc/runtime.h>

static NSString *hudWithWindowSetterGetterKey = @"hudWithWindowSetterGetterKey";
static NSString *progressWithWindowSetterGetterKey = @"progressWithWindowSetterGetterKey";

@implementation UIView (MBProgressHUD)

@dynamic hud;

- (void)setHud:(MBProgressHUD *)hud {
    objc_setAssociatedObject(self, &hudWithWindowSetterGetterKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (MBProgressHUD *)hud {
    return objc_getAssociatedObject(self, &hudWithWindowSetterGetterKey);
}

- (void)setProgress:(CGFloat)progress {
    objc_setAssociatedObject(self, &progressWithWindowSetterGetterKey, @(progress), OBJC_ASSOCIATION_ASSIGN);
    self.hud.progress = progress;
}
- (CGFloat)progress {
    return [objc_getAssociatedObject(self, &progressWithWindowSetterGetterKey) floatValue];
}

#pragma mark - 等待圈
- (void)showWindowProgressHUD {
    [self showWindowProgressHUDWithText:nil detail:nil delay:0];
}
- (void)showWindowProgressHUDWithDelay:(NSTimeInterval)delay {
    [self showWindowProgressHUDWithText:nil detail:nil delay:delay];
}
- (void)showWindowProgressHUDWithText:(NSString *)text {
    [self showWindowProgressHUDWithText:text detail:nil delay:0];
}
- (void)showWindowProgressHUDWithText:(NSString *)text delay:(NSTimeInterval)delay {
    [self showWindowProgressHUDWithText:text detail:nil delay:delay];
}
- (void)showWindowProgressHUDWithText:(NSString *)text detail:(NSString *)detail {
    [self showWindowProgressHUDWithText:text detail:detail delay:0];
}
- (void)showWindowProgressHUDWithText:(NSString *)text detail:(NSString *)detail delay:(NSTimeInterval)delay {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    if (text && text.length != 0) {
        [hud.label setText:text];
    }
    if (detail && detail.length != 0) {
        [hud.detailsLabel setText:detail];
    }
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    self.hud = hud;
}

#pragma mark - 进度圈
- (void)showWindowDeterminateHUD {
    [self showWindowDeterminateHUD:nil delay:0];
}
- (void)showWindowDeterminateHUD:(NSString *)text {
    [self showWindowDeterminateHUD:text delay:0];
}
- (void)showWindowDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    if (text && text.length != 0) {
        hud.label.text = text;
    }
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    self.hud = hud;
}


- (void)showWindowAnnularDeterminateHUD {
    [self showWindowAnnularDeterminateHUD:nil delay:0];
}
- (void)showWindowAnnularDeterminateHUD:(NSString *)text {
    [self showWindowAnnularDeterminateHUD:text delay:0];
}
- (void)showWindowAnnularDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    if (text && text.length != 0) {
        hud.label.text = text;
    }
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    self.hud = hud;
}


- (void)showWindowBarDeterminateHUD {
    [self showWindowBarDeterminateHUD:nil delay:0];
}
- (void)showWindowBarDeterminateHUD:(NSString *)text {
    [self showWindowBarDeterminateHUD:text delay:0];
}
- (void)showWindowBarDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    if (text && text.length != 0) {
        hud.label.text = text;
    }
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    self.hud = hud;
}


#pragma mark - 纯文本
- (void)showWindowTextHUD:(NSString *)text {
    [self showWindowTextHUD:text delay:2];
}
- (void)showWindowTextHUD:(NSString *)text delay:(NSTimeInterval)delay {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    hud.userInteractionEnabled = NO;
    
    self.hud = hud;
}


- (void)showWindowSuccessHUD {
    [self showWindowSuccessHUD:nil delay:0];
}
- (void)showWindowSuccessHUD:(NSString *)text {
    [self showWindowSuccessHUD:text delay:0];
}
- (void)showWindowSuccessHUD:(NSString *)text delay:(NSTimeInterval)delay {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:@"check_hud"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    if (text && text.length != 0) {
        hud.label.text = text;
    }
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    self.hud = hud;
}


- (void)showWindowErrorHUD {
    [self showWindowErrorHUD:nil delay:0];
}
- (void)showWindowErrorHUD:(NSString *)text {
    [self showWindowErrorHUD:text delay:0];
}
- (void)showWindowErrorHUD:(NSString *)text delay:(NSTimeInterval)delay {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:@"close_hud"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    if (text && text.length != 0) {
        hud.label.text = text;
    }
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    self.hud = hud;
}


- (void)hideWindowHUD {
    [self.hud hideAnimated:YES];
}
- (void)hideWindowHUD:(NSTimeInterval)delay {
    [self.hud hideAnimated:YES afterDelay:delay];
}



@end


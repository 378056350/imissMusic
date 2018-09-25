//
//  BaseView+MBProgressHUD.m
//  imiss
//
//  Created by MAC on 2018/8/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "UIView+MBProgressHUD.h"
#import <objc/runtime.h>

static NSString *hudWithSetterGetterKey = @"hudWithSetterGetterKey";
static NSString *progressWithSetterGetterKey = @"progressWithSetterGetterKey";

@implementation UIView (MBProgressHUD)

@dynamic hud;

- (void)setHud:(MBProgressHUD *)hud {
    objc_setAssociatedObject(self, &hudWithSetterGetterKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (MBProgressHUD *)hud {
    return objc_getAssociatedObject(self, &hudWithSetterGetterKey);
}

- (void)setProgress:(CGFloat)progress {
    objc_setAssociatedObject(self, &progressWithSetterGetterKey, @(progress), OBJC_ASSOCIATION_ASSIGN);
    self.hud.progress = progress;
}
- (CGFloat)progress {
    return [objc_getAssociatedObject(self, &progressWithSetterGetterKey) floatValue];
}

#pragma mark - 等待圈
- (void)showProgressHUD {
    [self showProgressHUDWithText:nil detail:nil delay:0];
}
- (void)showProgressHUDWithDelay:(NSTimeInterval)delay {
    [self showProgressHUDWithText:nil detail:nil delay:delay];
}
- (void)showProgressHUDWithText:(NSString *)text {
    [self showProgressHUDWithText:text detail:nil delay:0];
}
- (void)showProgressHUDWithText:(NSString *)text delay:(NSTimeInterval)delay {
    [self showProgressHUDWithText:text detail:nil delay:delay];
}
- (void)showProgressHUDWithText:(NSString *)text detail:(NSString *)detail {
    [self showProgressHUDWithText:text detail:detail delay:0];
}
- (void)showProgressHUDWithText:(NSString *)text detail:(NSString *)detail delay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    if (text && text.length != 0) {
        [hud.label setText:text];
    }
    if (detail && detail.length != 0) {
        [hud.detailsLabel setText:detail];
    }
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    if (self.hud) {
        [self.hud hideAnimated:NO];
    }
    self.hud = hud;
}


#pragma mark - 进度圈
- (void)showDeterminateHUD {
    [self showDeterminateHUD:nil delay:0];
}
- (void)showDeterminateHUD:(NSString *)text {
    [self showDeterminateHUD:text delay:0];
}
- (void)showDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    if (text && text.length != 0) {
        hud.label.text = text;
    }
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    if (self.hud) {
        [self.hud hideAnimated:NO];
    }
    self.hud = hud;
}


- (void)showAnnularDeterminateHUD {
    [self showAnnularDeterminateHUD:nil delay:0];
}
- (void)showAnnularDeterminateHUD:(NSString *)text {
    [self showAnnularDeterminateHUD:text delay:0];
}
- (void)showAnnularDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    if (text && text.length != 0) {
        hud.label.text = text;
    }
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    if (self.hud) {
        [self.hud hideAnimated:NO];
    }
    self.hud = hud;
}


- (void)showBarDeterminateHUD {
    [self showBarDeterminateHUD:nil delay:0];
}
- (void)showBarDeterminateHUD:(NSString *)text {
    [self showBarDeterminateHUD:text delay:0];
}
- (void)showBarDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    if (text && text.length != 0) {
        hud.label.text = text;
    }
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    if (self.hud) {
        [self.hud hideAnimated:NO];
    }
    self.hud = hud;
}


#pragma mark - 纯文本
- (void)showTextHUD:(NSString *)text {
    [self showTextHUD:text delay:2];
}
- (void)showTextHUD:(NSString *)text delay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    
    if (self.hud) {
        [self.hud hideAnimated:NO];
    }
    self.hud = hud;
}


- (void)showSuccessHUD {
    [self showSuccessHUD:nil delay:0];
}
- (void)showSuccessHUD:(NSString *)text {
    [self showSuccessHUD:text delay:0];
}
- (void)showSuccessHUD:(NSString *)text delay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
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
    if (self.hud) {
        [self.hud hideAnimated:NO];
    }
    self.hud = hud;
}


- (void)showErrorHUD {
    [self showSuccessHUD:nil delay:0];
}
- (void)showErrorHUD:(NSString *)text {
    [self showSuccessHUD:text delay:0];
}
- (void)showErrorHUD:(NSString *)text delay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
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
    if (self.hud) {
        [self.hud hideAnimated:NO];
    }
    self.hud = hud;
}


- (void)hideHUD {
    [self.hud hideAnimated:YES];
}
- (void)hideHUD:(NSTimeInterval)delay {
    [self.hud hideAnimated:YES afterDelay:delay];
}



@end

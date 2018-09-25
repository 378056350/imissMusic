//
//  UIViewController+MBProgressHUD.m
//  imiss
//
//  Created by MAC on 2018/8/16.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "UIViewController+MBProgressHUD.h"

@implementation UIViewController (MBProgressHUD)

#pragma mark - 等待圈
- (void)showProgressHUD {
    [self.view showProgressHUD];
}
- (void)showProgressHUDWithDelay:(NSTimeInterval)delay {
    [self.view showProgressHUDWithDelay:delay];
}
- (void)showProgressHUDWithText:(NSString *)text {
    [self.view showProgressHUDWithText:text];
}
- (void)showProgressHUDWithText:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showProgressHUDWithText:text delay:delay];
}
- (void)showProgressHUDWithText:(NSString *)text detail:(NSString *)detail {
    [self.view showProgressHUDWithText:text detail:detail];
}
- (void)showProgressHUDWithText:(NSString *)text detail:(NSString *)detail delay:(NSTimeInterval)delay {
    [self.view showProgressHUDWithText:text detail:detail delay:delay];
}


#pragma mark - 进度圈
- (void)showDeterminateHUD {
    [self.view showDeterminateHUD];
}
- (void)showDeterminateHUD:(NSString *)text {
    [self.view showDeterminateHUD:text];
}
- (void)showDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showDeterminateHUD:text delay:delay];
}


- (void)showAnnularDeterminateHUD {
    [self.view showAnnularDeterminateHUD];
}
- (void)showAnnularDeterminateHUD:(NSString *)text {
    [self.view showAnnularDeterminateHUD:text];
}
- (void)showAnnularDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showAnnularDeterminateHUD:text delay:delay];
}


- (void)showBarDeterminateHUD {
    [self.view showBarDeterminateHUD];
}
- (void)showBarDeterminateHUD:(NSString *)text {
    [self.view showBarDeterminateHUD:text];
}
- (void)showBarDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showBarDeterminateHUD:text delay:delay];
}


#pragma mark - 纯文本
- (void)showTextHUD:(NSString *)text {
    [self.view showTextHUD:text];
}
- (void)showTextHUD:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showTextHUD:text delay:delay];
}


- (void)showSuccessHUD {
    [self.view showSuccessHUD];
}
- (void)showSuccessHUD:(NSString *)text {
    [self.view showSuccessHUD:text];
}
- (void)showSuccessHUD:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showSuccessHUD:text delay:delay];
}


- (void)showErrorHUD {
    [self.view showErrorHUD];
}
- (void)showErrorHUD:(NSString *)text {
    [self.view showErrorHUD:text];
}
- (void)showErrorHUD:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showErrorHUD:text delay:delay];
}


- (void)hideHUD {
    [self.view.hud hideAnimated:YES];
}
- (void)hideHUD:(NSTimeInterval)delay {
    [self.view.hud hideAnimated:YES afterDelay:delay];
}






//=================================================================
//                            window
//=================================================================
#pragma mark - 等待圈
- (void)showWindowProgressHUD {
    [self.view showWindowProgressHUD];
}
- (void)showWindowProgressHUDWithDelay:(NSTimeInterval)delay {
    [self.view showWindowProgressHUDWithDelay:delay];
}
- (void)showWindowProgressHUDWithText:(NSString *)text {
    [self.view showWindowProgressHUDWithText:text];
}
- (void)showWindowProgressHUDWithText:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showWindowProgressHUDWithText:text delay:delay];
}
- (void)showWindowProgressHUDWithText:(NSString *)text detail:(NSString *)detail {
    [self.view showWindowProgressHUDWithText:text detail:detail];
}
- (void)showWindowProgressHUDWithText:(NSString *)text detail:(NSString *)detail delay:(NSTimeInterval)delay {
    [self.view showWindowProgressHUDWithText:text detail:detail delay:delay];
}

#pragma mark - 进度圈
- (void)showWindowDeterminateHUD {
    [self.view showWindowDeterminateHUD];
}
- (void)showWindowDeterminateHUD:(NSString *)text {
    [self.view showWindowDeterminateHUD:text];
}
- (void)showWindowDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showWindowDeterminateHUD:text delay:delay];
}

- (void)showWindowAnnularDeterminateHUD {
    [self.view showWindowAnnularDeterminateHUD];
}
- (void)showWindowAnnularDeterminateHUD:(NSString *)text {
    [self.view showWindowAnnularDeterminateHUD:text];
}
- (void)showWindowAnnularDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showWindowAnnularDeterminateHUD:text delay:delay];
}

- (void)showWindowBarDeterminateHUD {
    [self.view showWindowBarDeterminateHUD];
}
- (void)showWindowBarDeterminateHUD:(NSString *)text {
    [self.view showWindowBarDeterminateHUD:text];
}
- (void)showWindowBarDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showWindowBarDeterminateHUD:text delay:delay];
}

#pragma mark - 纯文本
- (void)showWindowTextHUD:(NSString *)text {
    [self.view showWindowTextHUD:text];
}
- (void)showWindowTextHUD:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showWindowTextHUD:text delay:delay];
}

- (void)showWindowSuccessHUD {
    [self.view showSuccessHUD];
}
- (void)showWindowSuccessHUD:(NSString *)text {
    [self.view showSuccessHUD:text];
}
- (void)showWindowSuccessHUD:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showSuccessHUD:text delay:delay];
}

- (void)showWindowErrorHUD {
    [self.view showWindowErrorHUD];
}
- (void)showWindowErrorHUD:(NSString *)text {
    [self.view showWindowErrorHUD:text];
}
- (void)showWindowErrorHUD:(NSString *)text delay:(NSTimeInterval)delay {
    [self.view showWindowErrorHUD:text delay:delay];
}

- (void)hideWindowHUD {
    [self.view hideWindowHUD];
}
- (void)hideWindowHUD:(NSTimeInterval)delay {
    [self.view hideWindowHUD:delay];
}

@end

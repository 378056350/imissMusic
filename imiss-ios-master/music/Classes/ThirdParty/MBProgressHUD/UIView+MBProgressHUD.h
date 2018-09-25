//
//  BaseView+MBProgressHUD.h
//  imiss
//
//  Created by MAC on 2018/8/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MBProgressHUD)

@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, assign) CGFloat progress;

#pragma mark - 等待圈
- (void)showProgressHUD;
- (void)showProgressHUDWithDelay:(NSTimeInterval)delay;
- (void)showProgressHUDWithText:(NSString *)text;
- (void)showProgressHUDWithText:(NSString *)text delay:(NSTimeInterval)delay;
- (void)showProgressHUDWithText:(NSString *)text detail:(NSString *)detail;
- (void)showProgressHUDWithText:(NSString *)text detail:(NSString *)detail delay:(NSTimeInterval)delay;

#pragma mark - 进度圈
- (void)showDeterminateHUD;
- (void)showDeterminateHUD:(NSString *)text;
- (void)showDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay;

- (void)showAnnularDeterminateHUD;
- (void)showAnnularDeterminateHUD:(NSString *)text;
- (void)showAnnularDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay;

- (void)showBarDeterminateHUD;
- (void)showBarDeterminateHUD:(NSString *)text;
- (void)showBarDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay;

#pragma mark - 纯文本
- (void)showTextHUD:(NSString *)text;
- (void)showTextHUD:(NSString *)text delay:(NSTimeInterval)delay;


- (void)showSuccessHUD;
- (void)showSuccessHUD:(NSString *)text;
- (void)showSuccessHUD:(NSString *)text delay:(NSTimeInterval)delay;


- (void)showErrorHUD;
- (void)showErrorHUD:(NSString *)text;
- (void)showErrorHUD:(NSString *)text delay:(NSTimeInterval)delay;

- (void)hideHUD;
- (void)hideHUD:(NSTimeInterval)delay;

@end

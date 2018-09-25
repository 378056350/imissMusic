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
- (void)showWindowProgressHUD;
- (void)showWindowProgressHUDWithDelay:(NSTimeInterval)delay;
- (void)showWindowProgressHUDWithText:(NSString *)text;
- (void)showWindowProgressHUDWithText:(NSString *)text delay:(NSTimeInterval)delay;
- (void)showWindowProgressHUDWithText:(NSString *)text detail:(NSString *)detail;
- (void)showWindowProgressHUDWithText:(NSString *)text detail:(NSString *)detail delay:(NSTimeInterval)delay;

#pragma mark - 进度圈
- (void)showWindowDeterminateHUD;
- (void)showWindowDeterminateHUD:(NSString *)text;
- (void)showWindowDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay;

- (void)showWindowAnnularDeterminateHUD;
- (void)showWindowAnnularDeterminateHUD:(NSString *)text;
- (void)showWindowAnnularDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay;

- (void)showWindowBarDeterminateHUD;
- (void)showWindowBarDeterminateHUD:(NSString *)text;
- (void)showWindowBarDeterminateHUD:(NSString *)text delay:(NSTimeInterval)delay;

#pragma mark - 纯文本
- (void)showWindowTextHUD:(NSString *)text;
- (void)showWindowTextHUD:(NSString *)text delay:(NSTimeInterval)delay;


- (void)showWindowSuccessHUD;
- (void)showWindowSuccessHUD:(NSString *)text;
- (void)showWindowSuccessHUD:(NSString *)text delay:(NSTimeInterval)delay;


- (void)showWindowErrorHUD;
- (void)showWindowErrorHUD:(NSString *)text;
- (void)showWindowErrorHUD:(NSString *)text delay:(NSTimeInterval)delay;

- (void)hideWindowHUD;
- (void)hideWindowHUD:(NSTimeInterval)delay;

@end


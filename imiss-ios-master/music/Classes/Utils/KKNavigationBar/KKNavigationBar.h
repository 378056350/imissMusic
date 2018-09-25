//
//  KKNavigationBar.h
//  imiss
//
//  Created by MAC on 2018/8/31.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - typedef
typedef void (^KKNavigationBarLeftClick)(void);
typedef void (^KKNavigationBarRightClick)(void);
typedef NS_ENUM(NSUInteger, KKNavigationBarStatus) {
    KKNavigationBarStatusOne,      // 一行
    KKNavigationBarStatusTwo,      // 两行
};

#pragma mark - 声明
@interface KKNavigationBar : BaseView

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, copy  ) KKNavigationBarLeftClick leftClick;
@property (nonatomic, copy  ) KKNavigationBarRightClick rightClick;
@property (nonatomic, assign) KKNavigationBarStatus status;

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end

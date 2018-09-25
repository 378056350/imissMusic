//
//  LinkageConfig.h
//  ZhongLv
//
//  Created by MAC on 2018/4/27.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"

@interface LinkageConfig : NSObject

@property (nonatomic, assign) CGRect titleFrame;
@property (nonatomic, assign) CGRect contentFrame;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *titleSelectedFont;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *titleSelectedColor;
@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, assign) CGFloat indicatorFixedWidth;
@property (nonatomic, assign) CGFloat indicatorAdditionalWidth;
@property (nonatomic, strong) UIColor *bottomSeparatorColor;
// 一下需要单独设置
@property (nonatomic, weak  ) BaseViewController *vc;
@property (nonatomic, strong) NSArray *vcs;
@property (nonatomic, strong) NSArray<NSString *> *titles;


/// 项目默认设置
+ (instancetype)initWithDefaultStyle;

@end

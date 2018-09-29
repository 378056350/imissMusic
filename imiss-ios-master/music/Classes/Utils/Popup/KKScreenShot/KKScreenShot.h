//
//  KKScreenShot.h
//  music
//
//  Created by zhongke on 2018/9/29.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKPopupView.h"
#import "KKScreenShotContent.h"

#pragma mark - 声明
@interface KKScreenShot : KKPopupView

@property (nonatomic, strong) KKScreenShotContent *contentv;

+ (instancetype)init;

@end

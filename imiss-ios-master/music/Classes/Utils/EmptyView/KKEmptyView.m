//
//  KKEmptyView.m
//  music
//
//  Created by zhongke on 2018/9/29.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKEmptyView.h"

#pragma mark - 声明
@interface KKEmptyView()

@end

#pragma mark - 实现
@implementation KKEmptyView

- (void)initUI {
    
}

#pragma mark - set
- (void)setStyle:(KKEmptyStyle)style {
    _style = style;
    // 默认样式
    if (style == KKEmptyStyleDefault) {
        
    }
}
- (void)setStatus:(KKEmptyStatus)status {
    _status = status;
    
}

@end

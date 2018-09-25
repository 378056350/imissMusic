//
//  MJRefreshNormalHeader+Extension.h
//  ZhongLv
//
//  Created by MAC on 2018/5/4.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "MJRefreshNormalHeader.h"

@interface MJRefreshNormalHeader (Extension)

/// 下拉刷新
+ (MJRefreshNormalHeader *)getHeaderRefreshTarget:(id)target action:(SEL)sel;

@end

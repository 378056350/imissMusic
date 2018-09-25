//
//  MJRefreshNormalHeader+Extension.m
//  ZhongLv
//
//  Created by MAC on 2018/5/4.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "MJRefreshNormalHeader+Extension.h"

@implementation MJRefreshNormalHeader (Extension)

+ (MJRefreshNormalHeader *)getHeaderRefreshTarget:(id)target action:(SEL)sel {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:sel];
    header.stateLabel.hidden = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.backgroundColor = [UIColor clearColor];
    return header;
}



@end

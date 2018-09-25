//
//  MJRefreshBackNormalFooter+Extension.m
//  ZhongLv
//
//  Created by MAC on 2018/5/23.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "MJRefreshBackNormalFooter+Extension.h"

@implementation MJRefreshBackNormalFooter (Extension)

+ (MJRefreshBackNormalFooter *)getFooterRefreshTarget:(id)target action:(SEL)sel {
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:target refreshingAction:sel];
    footer.stateLabel.text = @"";
    footer.stateLabel.hidden = YES;
    return footer;
}
- (void)endRefreshingWithNoMoreData {
    [super endRefreshingWithNoMoreData];
    self.arrowView.hidden = YES;
    self.stateLabel.hidden = NO;
}
- (void)endRefreshing {
    [super endRefreshing];
    self.arrowView.hidden = NO;
    self.stateLabel.text = @"";
    self.stateLabel.hidden = YES;
}

@end

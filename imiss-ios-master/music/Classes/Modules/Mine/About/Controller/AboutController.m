//
//  AboutController.m
//  music
//
//  Created by 郑业强 on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "AboutController.h"

#pragma mark - 声明
@interface AboutController()

@property (nonatomic, strong) KKHeaderView *header;

@end

#pragma mark - 实现
@implementation AboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self header];
}
- (KKHeaderView *)header {
    if (!_header) {
        _header = [KKHeaderView loadCode:CGRectZero];
        _header.name = @"About";
        [self.view addSubview:_header];
    }
    return _header;
}

@end

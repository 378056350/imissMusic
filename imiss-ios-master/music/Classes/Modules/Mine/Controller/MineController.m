//
//  MineController.m
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MineController.h"
#import "MineHeader.h"
#import "MineCell.h"

#pragma mark - 声明
@interface MineController()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) MineHeader *header;
@property (nonatomic, strong) UITableView *table;

@end

#pragma mark - 实现
@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self header];
    [self table];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineCell *cell = [MineCell loadFirstNib:tableView];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return countcoordinatesX(40);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - get
- (MineHeader *)header {
    if (!_header) {
        _header = [MineHeader loadCode:CGRectMake(0, StatusBarHeight, SCREEN_WIDTH, 80)];
        [self.view addSubview:_header];
    }
    return _header;
}
- (UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_header.frame), SCREEN_WIDTH, SCREEN_HEIGHT - TabbarHeight - CGRectGetMaxY(_header.frame)) style:UITableViewStylePlain];
        _table.backgroundColor = kColor_BG;
        _table.delegate = self;
        _table.dataSource = self;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_table];
    }
    return _table;
}


@end


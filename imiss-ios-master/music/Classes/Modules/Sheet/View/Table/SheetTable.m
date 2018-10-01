//
//  SheetTable.m
//  music
//
//  Created by zhongke on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SheetTable.h"
#import "SheetTableCell.h"

#pragma mark - 声明
@interface SheetTable()<UITableViewDelegate, UITableViewDataSource>

@end

#pragma mark - 实现
@implementation SheetTable

+ (instancetype)initWithFrame:(CGRect)frame {
    SheetTable *table = [[SheetTable alloc] initWithFrame:frame style:UITableViewStylePlain];
    table.delegate = table;
    table.dataSource = table;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.backgroundColor = [UIColor clearColor];
    return table;
}

#pragma mark - set
- (void)setModels:(NSMutableArray<SongModel *> *)models {
    _models = models;
    [self reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SheetTableCell *cell = [SheetTableCell loadFirstNib:tableView];
    cell.model = self.models[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return countcoordinatesX(44);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

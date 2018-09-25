//
//  KKSheetContent.m
//  imiss
//
//  Created by 郑业强 on 2018/9/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKSheetContent.h"
#import "KKSheetCell.h"

#pragma mark - 声明
@interface KKSheetContent()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, strong) NSArray<NSArray<NSString *> *> *names;

@end

#pragma mark - 实现
@implementation KKSheetContent

- (void)initUI {
    [self.table setBackgroundColor:[UIColor clearColor]];
    [self.table setSeparatorColor:kColor_BG];
    [self.table setScrollEnabled:NO];
    [self.table setSeparatorInset:UIEdgeInsetsMake(0, 15 + 30, 0, 20)];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.names[0].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKSheetCell *cell = [KKSheetCell loadFirstNib:tableView];
    cell.name.text = self.names[0][indexPath.row];
    cell.icon.image = [UIImage imageNamed:self.names[1][indexPath.row]];
    // 管理歌单
    if (indexPath.row == 1) {
        cell.enable = NO;
    }
    // 新建歌单, 回复歌单
    else {
        cell.enable = YES;
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return countcoordinatesX(50);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return countcoordinatesX(40);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, countcoordinatesX(40))];
    [header setBackgroundColor:kColor_White];
    [header setRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight radius:10];
    [header addSubview:({
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(countcoordinatesX(15), 0, SCREEN_WIDTH / 2, header.height)];
        [lab setText:@"我创建的歌单"];
        [lab setFont:[UIFont systemFontOfSize:AdjustFont(12) weight:UIFontWeightLight]];
        [lab setTextColor:kColor_Text_Black];
        lab;
    })];
    return header;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_click) {
        _click(indexPath.row);
    }
}

#pragma mark - get
- (NSArray<NSArray<NSString *> *> *)names {
    if (!_names) {
        _names = @[@[@"新建歌单", @"管理歌单", @"回复歌单"],@[@"新建歌单", @"管理歌单", @"回复歌单"]];
    }
    return _names;
}

@end

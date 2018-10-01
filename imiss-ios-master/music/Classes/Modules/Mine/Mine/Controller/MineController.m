//
//  MineController.m
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MineController.h"
#import "MineCell.h"
#import "BaseTabBar.h"
#import "AboutController.h"

#pragma mark - 声明
@interface MineController()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) KKHeaderView *header;
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray<NSArray<NSString *> *> *contents;
@property (nonatomic, strong) UIView *footer;

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
    return self.contents.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contents[section].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineCell *cell = [MineCell loadFirstNib:tableView];
    cell.index = indexPath;
    cell.name.text = self.contents[indexPath.section][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return countcoordinatesX(40);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        // 锁屏歌词
        if (indexPath.row == 0) {
            
        }
        // 夜间模式
        else if (indexPath.row == 1) {
            
        }
    }
    else if (indexPath.section == 1) {
        // 截屏后提示分享
        if (indexPath.row == 0) {
            
        }
        // 寻找并邀请好友
        else if (indexPath.row == 1) {
            KKShare *share = [KKShare init];
            [share show];
        }
        // 分享imiss
        else if (indexPath.row == 2) {
            KKShare *share = [KKShare init];
            [share show];
        }
        // 关于
        else if (indexPath.row == 3) {
            AboutController *vc = [[AboutController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = ({
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(countcoordinatesX(15), 2, SCREEN_WIDTH, 0.5)];
        line.backgroundColor = [kColor_Text_Gary colorWithAlphaComponent:0.2];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 5)];
        [view addSubview:line];
        view;
    });
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

#pragma mark - get
- (KKHeaderView *)header {
    if (!_header) {
        _header = [KKHeaderView loadCode:CGRectZero];
        _header.name = @"Mine";
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
        _table.tableFooterView = [self footer];
        _table.bounces = NO;
        [self.view addSubview:_table];
    }
    return _table;
}
- (UIView *)footer {
    if (!_footer) {
        _footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        [self.view addSubview:_footer];
        UIView *line = ({
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(countcoordinatesX(15), 0, SCREEN_WIDTH, 0.5f)];
            line.backgroundColor = [kColor_Text_Gary colorWithAlphaComponent:0.2];
            line;
        });
        [_footer addSubview:line];
        UILabel *lab = ({
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(countcoordinatesX(15), CGRectGetMaxY(line.frame), SCREEN_WIDTH, 30)];
            lab.font = [UIFont systemFontOfSize:AdjustFont(10)];
            lab.text = @"V6.0 @2018 Phythmical Studio. All rights erserved.";
            lab.textColor = kColor_Text_Gary;
            lab;
        });
        [_footer addSubview:lab];
    }
    return _footer;
}
- (NSArray<NSArray<NSString *> *> *)contents {
    if (!_contents) {
        _contents = @[
                      @[@"夜间模式"],
                      @[@"截屏后提示分享",@"寻找并邀请好友",@"分享imiss",@"关于"]
                      ];
    }
    return _contents;
}

@end


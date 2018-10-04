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
    table.allowNight = YES;
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
    // 回调
    if (self.sheetDelegate && [self.sheetDelegate respondsToSelector:@selector(sheetTable:didSelectRowAtIndexPath:)]) {
        [self.sheetDelegate sheetTable:self didSelectRowAtIndexPath:indexPath];
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.hidden = YES;
    
    
    POPBasicAnimation *basic = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        basic.beginTime = CACurrentMediaTime() + indexPath.row * 0.1f;
        basic.fromValue = @(CGPointMake(SCREEN_WIDTH * 1.5, cell.top + cell.height / 2));
        basic.toValue   = @(CGPointMake(SCREEN_WIDTH * 0.5, cell.top + cell.height / 2));
        basic.duration  = 0.3f;
        basic;
    });
    [basic setAnimationDidStartBlock:^(POPAnimation *anim) {
        cell.hidden = NO;
    }];
    [cell pop_addAnimation:basic forKey:@"basic"];
}

@end

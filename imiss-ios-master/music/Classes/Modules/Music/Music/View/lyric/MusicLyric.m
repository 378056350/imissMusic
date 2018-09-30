//
//  MusicLyric.m
//  imiss
//
//  Created by 郑业强 on 2018/9/2.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicLyric.h"
#import "MusicLyricCell.h"

// Cell高度
#define CellH countcoordinatesX(30)
// 列表高度
#define TableH (self.height - CellH) / 2
// 当前行透明度
#define CurrentAlpha 1
// 滚动行透明度
#define ScrollAlpha 0.5

#pragma mark - 声明
@interface MusicLyric()<UITableViewDelegate, UITableViewDataSource> {
    NSInteger _current;
}

// 列表
@property (nonatomic, strong) UITableView *table;
// 选中
@property (nonatomic, strong) NSMutableArray *chooses;
// 定时
@property (nonatomic, strong) NSTimer *timer;
// 管理
@property (nonatomic, strong) MusicModules *modules;

@end

#pragma mark - 实现
@implementation MusicLyric

- (void)initUI {
    _current = 0;
    [self.modules setStatus:MusicLyricStatusPlay];
    [self table];
    [self flag];
    [self setAlpha:0];
    
    __weak typeof(self) weak = self;
    self.maskView = ({
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = weak.table.bounds;
        gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                 (__bridge id)[UIColor blackColor].CGColor,
                                 (__bridge id)[UIColor blackColor].CGColor,
                                 (__bridge id)[UIColor clearColor].CGColor];
        gradientLayer.locations = @[@(0.0), @(0.2), @(0.9), @(1.0)];
        gradientLayer.startPoint = CGPointMake(0.5, 0);
        gradientLayer.endPoint = CGPointMake(0.5, 1);
        
        UIView *ontentMaskView = [[UIView alloc] initWithFrame:weak.table.bounds];
        [ontentMaskView.layer addSublayer:gradientLayer];
        ontentMaskView;
    });
}
// 选中cell
- (void)chooseIndex:(NSInteger)index {
    CGFloat tableCenterX = _table.contentOffset.y + CellH / 2 + TableH;
    for (NSInteger i=0; i<_model.lrcs.count; i++) {
        CGFloat cellCenterX = i * CellH + CellH / 2 + TableH;
        BOOL isChoose = ABS(cellCenterX - tableCenterX) < CellH / 2;
        isChoose = isChoose || [self.chooses containsObject:@(i)];
        CGFloat alpha = 0;
        if (isChoose == YES) {
            alpha = [self.chooses[0] isEqual:@(i)] ? CurrentAlpha : ScrollAlpha;
        }
        
        MusicLyricCell *cell = [_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [cell choose:isChoose alpha:alpha animation:YES];
    }
}
// 获取当前行数
- (NSInteger)getIndex {
    CGFloat offsetY = _table.contentOffset.y + CellH * 0.5;
    offsetY = (NSInteger)offsetY;
    NSInteger cellH = (NSInteger)CellH;
    NSInteger count = offsetY / cellH;
    return count;
}

#pragma mark - set
// 数据
- (void)setModel:(ResourceModel *)model {
    _model = model;
    [_table reloadData];
}

// 播放中
- (void)music:(MusicModules *)manager playing:(NSString *)music progress:(CGFloat)progress currentTime:(NSTimeInterval)currentTime totalTime:(NSTimeInterval)totalTime {
    // 行数
    NSInteger line = [_model getLineWithSecond:currentTime];
    self.chooses[0] = @(line);
    [self chooseIndex:line];
    // 播放状态
    if (self.modules.status == MusicLyricStatusPlay) {
        [self scrollTableWithIndex:line animation:YES];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.lrcs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MusicLyricCell *cell = [MusicLyricCell loadCode:tableView];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setLrc:self.model.lrcs[indexPath.row]];
    
    
    if ([self.chooses containsObject:@(indexPath.row)]) {
        CGFloat alpha = [self.chooses[0] isEqual:@(indexPath.row)] ? CurrentAlpha : ScrollAlpha;
        [cell choose:YES alpha:alpha animation:NO];
    }
    else {
        [cell choose:NO alpha:0 animation:NO];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellH;
}

#pragma mark - UIScrollViewDelegate
// 开始滑动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.modules setStatus:MusicLyricStatusScroll];
    _flag.alpha = 1;
}
// 正在滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger line = [self getIndex];
    self.chooses[1] = @(line);
    // 时间
    [self.flag.time setText:[_model getTimeWithLine:line]];
}
// 松手
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // 停止滚动
    if (decelerate == NO) {
        [self.modules setStatus:MusicLyricStatusScrollEndTimeCount];
        NSInteger count = [self getIndex];
        [self chooseIndex:count];
        [self scrollTableWithIndex:count animation:YES];
        // 取消上一次的执行
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(cancleFlag) object:nil];
        // 隐藏Flag
        [self performSelector:@selector(cancleFlag) withObject:nil afterDelay:3.f];
    }
}
// 停止滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self.modules setStatus:MusicLyricStatusScrollEndTimeCount];
    NSInteger count = [self getIndex];
    [self chooseIndex:count];
    [self scrollTableWithIndex:count animation:YES];
    // 取消上一次的执行
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(cancleFlag) object:nil];
    // 隐藏Flag
    [self performSelector:@selector(cancleFlag) withObject:nil afterDelay:3.f];
}

// 隐藏Flag
- (void)cancleFlag {
    if (self.modules.status == MusicLyricStatusScrollEndTimeCount) {
        [self.modules setStatus:MusicLyricStatusPlay];
        _flag.alpha = 0;
    }
}
// 滚动Flag
- (void)scrollTableWithIndex:(CGFloat)index animation:(BOOL)animation {
    if (self.modules.status == MusicLyricStatusScroll) {
        return;
    }
    NSTimeInterval time = animation == YES ? 0.3f : 0;
    [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _table.contentOffset = CGPointMake(0, index * CellH);
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - get
- (UITableView *)table {
    if (!_table) {
        UIView *edg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TableH)];
        _table = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.tableHeaderView = edg;
        _table.tableFooterView = edg;
        _table.backgroundColor = [UIColor clearColor];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_table];
    }
    return _table;
}
- (NSMutableArray *)chooses {
    if (!_chooses) {
        _chooses = [NSMutableArray arrayWithArray:@[@(0),@(0)]];
    }
    return _chooses;
}
- (MusicFlag *)flag {
    if (!_flag) {
        _flag = [MusicFlag loadFirstNib:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
        _flag.centerY = self.height / 2;
        _flag.alpha = 0;
        [self addSubview:_flag];
    }
    return _flag;
}
- (MusicModules *)modules {
    if (!_modules) {
        _modules = [MusicModules shareMusicModules];
    }
    return _modules;
}

@end




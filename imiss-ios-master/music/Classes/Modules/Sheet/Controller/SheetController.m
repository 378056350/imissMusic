//
//  SheetController.m
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SheetController.h"
#import "SheetCollection.h"
#import "SheetTable.h"
#import "SheetModel.h"

#pragma mark - 声明
@interface SheetController()<SheetCollectionDelegate> {
    // 当前选中Index
    NSInteger _selectIndex;
}

@property (nonatomic, strong) KKHeaderView *header;
@property (nonatomic, strong) BaseView *collectionView;
@property (nonatomic, strong) SheetCollection *collection;
@property (nonatomic, strong) SheetTable *table;
@property (nonatomic, strong) NSMutableArray<SheetModel *> *sheets;
@property (nonatomic, strong) NSMutableArray<SongModel *> *songs;

@end

#pragma mark - 实现
@implementation SheetController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self header];
    [self collection];
    [self table];
    [self getSheetRequest];
    [self.view setAllowNight:YES];
}

#pragma mark - set
// 歌单
- (void)setSheets:(NSMutableArray<SheetModel *> *)sheets {
    _sheets = sheets;
    _collection.models = sheets;
    [self getSongWithSheetRequest];
}
// 音乐
- (void)setSongs:(NSMutableArray<SongModel *> *)songs {
    _songs = songs;
    _table.models = songs;
}

#pragma mark - 请求
// 歌单请求
- (void)getSheetRequest {
    __weak typeof(self) weak = self;
    [self.collectionView showEmptyView:EmptyStateLoading eventBlock:nil];
    [AFNManager POST:CreateSheetRequest params:nil complete:^(APPResult *result) {
        // 成功
        if (result.status == ServiceStatusSuccess || DEBUG) {
            // 隐藏
            [weak.collectionView hideEmptyView];
            if (DEBUG) {
                result = [APPResult new];
                result.data = [FakeData sheetData];
            }
            // 赋值
            NSMutableArray<SheetModel *> *array = [SheetModel mj_objectArrayWithKeyValuesArray:result.data];
            [weak setSheets:array];
        }
        // 失败
        else {
            [weak.collectionView showEmptyView:EmptyStateNetkFailButton eventBlock:^{
                [weak.collectionView showEmptyView:EmptyStateLoading eventBlock:nil];
                [weak getSheetRequest];
            }];
        }
    }];
}
// 通过歌单找歌曲
- (void)getSongWithSheetRequest {
    __weak typeof(self) weak = self;
    [AFNManager POST:CreateSongWithSheetRequest params:nil complete:^(APPResult *result) {
        [weak hideHUD];
        // 成功
        if (result.status == ServiceStatusSuccess || DEBUG) {
            if (DEBUG) {
                result = [APPResult new];
                result.data = [FakeData songWithSheet];
            }
            NSMutableArray<SongModel *> *array = [SongModel mj_objectArrayWithKeyValuesArray:result.data];
            [weak setSongs:array];
        }
        // 失败
        else {
            NSLog(@"fail");
        }
    }];
}

#pragma mark - SheetCollectionDelegate
// 点击/滑动到某个Item
- (void)sheetCollection:(SheetCollection *)collection didSelectOrSwipeItemAtIndex:(NSInteger)index click:(BOOL)isClick {
    _selectIndex = index;
    // NSLog(@"操作方式: %@,  Item: %ld", isClick == YES ? @"点击" : @"滑动", index);
    [self showProgressHUD];
    [self getSongWithSheetRequest];
}

#pragma mark - get
- (KKHeaderView *)header {
    if (!_header) {
        _header = [KKHeaderView loadCode:CGRectZero];
        _header.name = @"Sheet";
        [self.view addSubview:_header];
    }
    return _header;
}
- (BaseView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[BaseView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_header.frame), SCREEN_WIDTH, SCREEN_HEIGHT - TabbarHeight)];
        _collectionView.allowNight = YES;
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}
- (SheetCollection *)collection {
    if (!_collection) {
        _collection = [SheetCollection initWithFrame:CGRectMake(0, 0, self.collectionView.width, countcoordinatesY(140))];
        _collection.sheetDelegate = self;
        [self.collectionView addSubview:_collection];
    }
    return _collection;
}
- (SheetTable *)table {
    if (!_table) {
        _table = [SheetTable initWithFrame:({
            CGFloat top = CGRectGetMaxY(_collection.frame);
            CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - TabbarHeight - top);
        })];
        _table.contentInset = UIEdgeInsetsMake(countcoordinatesX(10), 0, 0, 0);
        [self.collectionView addSubview:_table];
    }
    return _table;
}

@end

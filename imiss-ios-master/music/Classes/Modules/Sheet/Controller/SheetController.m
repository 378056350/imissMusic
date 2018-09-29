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

#pragma mark - 声明
@interface SheetController()<SheetCollectionDelegate>

@property (nonatomic, strong) KKHeaderView *header;
@property (nonatomic, strong) SheetCollection *collection;
@property (nonatomic, strong) SheetTable *table;

@end

#pragma mark - 实现
@implementation SheetController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self header];
    [self collection];
    [self table];
}

#pragma mark - SheetCollectionDelegate
// 点击/滑动到某个Item
- (void)sheetCollection:(SheetCollection *)collection didSelectOrSwipeItemAtIndex:(NSInteger)index click:(BOOL)isClick {
    NSLog(@"操作方式: %@,  Item: %ld", isClick == YES ? @"点击" : @"滑动", index);
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
- (SheetCollection *)collection {
    if (!_collection) {
        _collection = [SheetCollection initWithFrame:CGRectMake(0, CGRectGetMaxY(_header.frame), SCREEN_WIDTH, countcoordinatesX(140))];
        _collection.sheetDelegate = self;
        [self.view addSubview:_collection];
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
        [self.view addSubview:_table];
    }
    return _table;
}

@end

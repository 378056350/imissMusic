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
@interface SheetController()

@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) SheetCollection *collection;
@property (nonatomic, strong) SheetTable *table;

@end

#pragma mark - 实现
@implementation SheetController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self name];
    [self collection];
    [self table];
}

#pragma mark - get
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] initWithFrame:CGRectMake(countcoordinatesX(15), StatusBarHeight, SCREEN_WIDTH, countcoordinatesX(60))];
        _name.attributedText = [NSAttributedString shadowAttrString:@"Sheet" color:kColor_Text_Gary fontSize:16 alignment:NSTextAlignmentLeft];
        [self.view addSubview:_name];
    }
    return _name;
}
- (SheetCollection *)collection {
    if (!_collection) {
        _collection = [SheetCollection initWithFrame:CGRectMake(0, CGRectGetMaxY(_name.frame), SCREEN_WIDTH, countcoordinatesX(140))];
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

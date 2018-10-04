//
//  SheetTable.h
//  music
//
//  Created by zhongke on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 代理
@class SheetTable;
@protocol SheetTableDelegate<NSObject>
@optional
- (void)sheetTable:(SheetTable *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end


#pragma mark - 声明
@interface SheetTable : UITableView

@property (nonatomic, strong) NSMutableArray<SongModel *> *models;
@property (nonatomic, weak  ) id<SheetTableDelegate> sheetDelegate;

+ (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END

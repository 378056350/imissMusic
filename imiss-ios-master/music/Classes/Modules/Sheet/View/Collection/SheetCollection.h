//
//  SheetCollection.h
//  music
//
//  Created by zhongke on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "SheetModel.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 代理
@class SheetCollection;
@protocol SheetCollectionDelegate<NSObject>
@optional
// 点击/滑动到某个Item
- (void)sheetCollection:(SheetCollection *)collection didSelectOrSwipeItemAtIndex:(NSInteger)index click:(BOOL)isClick;

@end

#pragma mark - 声明
@interface SheetCollection : BaseCollectionView

@property (nonatomic, weak  ) id<SheetCollectionDelegate> sheetDelegate;
@property (nonatomic, strong) NSMutableArray<SheetModel *> *models;

+ (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END

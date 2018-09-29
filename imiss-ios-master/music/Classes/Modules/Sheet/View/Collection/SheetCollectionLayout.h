//
//  SheetCollectionLayout.h
//  music
//
//  Created by 郑业强 on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SheetCollection.h"

#pragma mark - 代理
@class SheetCollectionLayout;
@protocol SheetCollectionLayoutDelegate<NSObject>
@optional
- (void)collectionLayout:(SheetCollectionLayout *)layout didSelectItemWithIndex:(NSInteger)index;

@end

#pragma mark - 声明
@interface SheetCollectionLayout : UICollectionViewFlowLayout

@property (nonatomic, weak  ) id<SheetCollectionLayoutDelegate> delegate;
@property (nonatomic, strong) SheetCollection *collection;

@end

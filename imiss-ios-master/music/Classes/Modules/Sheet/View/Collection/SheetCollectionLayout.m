//
//  SheetCollectionLayout.m
//  music
//
//  Created by 郑业强 on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SheetCollectionLayout.h"
#import "SheetCollectionCell.h"

#define CELLW 80
#define INSET countcoordinatesX(10)

#pragma mark - 声明
@interface SheetCollectionLayout() {
    SheetCollectionCell *_selectCell;
}

@end

#pragma mark - 实现
@implementation SheetCollectionLayout

- (void)prepareLayout {
    [super prepareLayout];
    [self setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self setMinimumLineSpacing:INSET];
    [self setSectionInset:UIEdgeInsetsMake(0, INSET, 0, SCREEN_WIDTH - CELLW - INSET * 2)];
}


/*
 * 这个方法的返回值是一个数组，（数组里存放着rect范围内所有元素的布局属性）
 * 这个方法的返回值决定了rect范围内所有元素的排布（frame）
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    // 获取super已经计算好的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    // 计算collectionView最中心的X值
    CGFloat collectionCenterX = self.collectionView.contentOffset.x + INSET + CELLW / 2;
    // 在原有布局的基础上，进行微调
    NSIndexPath *_currentIndex;
    CGFloat maxScale = 0.8;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        // 计算cell中心点X值
        CGFloat cellX = attrs.center.x;
        // 计算collectionView中心点X值和Cell中心点X值间的距离
        CGFloat delta = ABS(cellX-collectionCenterX);
        // 根据间距计算 cell的缩放比例
        CGFloat scale = 1 - delta/self.collectionView.frame.size.width;
        if (scale < 0.8) {
            scale = 0.8;
        }
        // 找到当前显示的Item
        if (maxScale < scale) {
            maxScale = scale;
            _currentIndex = attrs.indexPath;
        }
        // 设置缩放比例
        attrs.transform3D = CATransform3DMakeScale(scale, scale, 1);
    }
    
    // 找到当前显示Item
    if (_currentIndex) {
        if (_selectCell) {
            [_selectCell hide:YES];
        }
        SheetCollectionCell *cell = (SheetCollectionCell *)[_collection cellForItemAtIndexPath:_currentIndex];
        [cell show:YES];
        _selectCell = cell;
    }
    
    return array;
    
}

// 这个方法的返回值，决定了colletionView停止滚动时的偏移量
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    // 计算出最终显示的矩形框
    CGRect rect;
    rect.origin.x = proposedContentOffset.x;
    rect.origin.y = 0;
    rect.size = self.collectionView.frame.size;

    // 获取滚动结束后super已经计算好的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    // 计算collectionView最中心点的X值
    CGFloat collectionCenterX = self.collectionView.contentOffset.x + INSET + CELLW / 2;
    // 存放最小的间距
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (ABS(minDelta)>ABS(attrs.center.x-collectionCenterX)) {
            minDelta = attrs.center.x-collectionCenterX;
        }
    }
    // 修改原有的偏移量
    proposedContentOffset.x += minDelta;


    CGFloat left = proposedContentOffset.x;
    NSInteger index = (left + (CELLW + INSET) * 0.4) / (CELLW + INSET);
    proposedContentOffset.x = index * (CELLW + INSET);

    // 回调
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectionLayout:didSelectItemWithIndex:)]) {
        [self.delegate collectionLayout:self didSelectItemWithIndex:index];
    }
    
    return proposedContentOffset;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}


@end

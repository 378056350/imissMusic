//
//  HomeCollectionLayout.m
//  music
//
//  Created by 郑业强 on 2018/9/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionLayout.h"

#define CELLW (SCREEN_WIDTH - 80 + 10)
#define INSET (self.collectionView.frame.size.width - CELLW) * 0.5

#pragma mark - 声明
@interface HomeCollectionLayout()

@end

#pragma mark - 实现
@implementation HomeCollectionLayout

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}


- (void)prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    self.minimumLineSpacing = INSET / 2;
    self.sectionInset = UIEdgeInsetsMake(0, (SCREEN_WIDTH - CELLW) / 2, 0, (SCREEN_WIDTH - CELLW) / 2);
}

// colletionView停止滚动时的偏移量
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    //计算出最终显示的矩形框
    CGRect rect;
    rect.origin.x = proposedContentOffset.x;
    rect.origin.y = 0;
    rect.size = self.collectionView.frame.size;
    
    // 获取滚动结束后super已经计算好的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    // 计算collectionView最中心点的X值
    CGFloat collectionCenterX = self.collectionView.contentOffset.x + CELLW * 0.5;
    // 存放最小的间距
    CGFloat minDelta = MAXFLOAT;
    for (int i=0; i<array.count; i++) {
        UICollectionViewLayoutAttributes *attrs = array[i];
        if (ABS(minDelta)>ABS(attrs.center.x-collectionCenterX)) {
            minDelta = attrs.center.x - collectionCenterX;
        }
    }
    // 修改原有的偏移量
    CGFloat left = proposedContentOffset.x;
    NSInteger index = (left + CELLW * 0.4) / CELLW;
    proposedContentOffset.x = index * (CELLW + INSET / 2);
    return proposedContentOffset;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end

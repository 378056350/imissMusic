//
//  SheetCollection.m
//  music
//
//  Created by zhongke on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SheetCollection.h"
#import "SheetCollectionCell.h"
#import "SheetCollectionLayout.h"

#define CELLW 80
#define INSERT countcoordinatesX(10)

#pragma mark - 声明
@interface SheetCollection()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

#pragma mark - 实现
@implementation SheetCollection

+ (instancetype)initWithFrame:(CGRect)frame {
    SheetCollection *collection = [[SheetCollection alloc] initWithFrame:frame collectionViewLayout:({
        SheetCollectionLayout *flow = [[SheetCollectionLayout alloc] init];
        flow.itemSize = CGSizeMake(80, 80);
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flow;
    })];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setDelegate:collection];
    [collection setDataSource:collection];
    [collection registerNib:[UINib nibWithNibName:@"SheetCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"SheetCollectionCell"];
    [collection setContentOffset:CGPointMake(0, 0)];
    return collection;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SheetCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SheetCollectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat offsetX = indexPath.row * (INSERT + CELLW);
    [collectionView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}


@end

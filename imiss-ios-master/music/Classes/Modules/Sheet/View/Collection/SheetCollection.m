//
//  SheetCollection.m
//  music
//
//  Created by zhongke on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SheetCollection.h"
#import "SheetCollectionCell.h"

#pragma mark - 声明
@interface SheetCollection()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

#pragma mark - 实现
@implementation SheetCollection

+ (instancetype)initWithFrame:(CGRect)frame {
    SheetCollection *collection = [[SheetCollection alloc] initWithFrame:frame collectionViewLayout:({
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.itemSize = CGSizeMake(80, 80);
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flow;
    })];
    collection.delegate = collection;
    collection.dataSource = collection;
    [collection registerNib:[UINib nibWithNibName:@"SheetCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"SheetCollectionCell"];
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

@end

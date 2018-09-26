//
//  HomeCollection.m
//  music
//
//  Created by 郑业强 on 2018/9/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollection.h"
#import "HomeCollectionLayout.h"

#pragma mark - 声明
@interface HomeCollection()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UICollectionView *collection;

@end

#pragma mark - 实现
@implementation HomeCollection

#pragma mark - 声明
+ (instancetype)initWithFrame:(CGRect)frame {
    HomeCollection *view = [[HomeCollection alloc] initWithFrame:frame];
    [view nameLab];
    [view collection];
    [view.nameLab setFrame:CGRectMake(0, 30, SCREEN_WIDTH, 40)];
    [view.collection setFrame:CGRectMake(0, CGRectGetMaxY(view.nameLab.frame), SCREEN_WIDTH, frame.size.height - CGRectGetMaxY(view.nameLab.frame))];
    [view bringSubviewToFront:view.nameLab];
    return view;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionCell *cell = [HomeCollectionCell loadItem:collectionView index:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    CGFloat top = ((self.height - (SCREEN_WIDTH - 80) / 2 * 3) / 2);
    return UIEdgeInsetsMake(-top, 40, 0, 40);
}

#pragma mark - get
- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
        _nameLab.textAlignment = NSTextAlignmentCenter;
        _nameLab.attributedText = ({
            NSAttributedString *attm = [NSAttributedString shadowAttrString:@"497 Popular Music" color:kColor_Text_Gary font:_nameLab.font alignment:NSTextAlignmentCenter];
            attm;
        });
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
- (UICollectionView *)collection {
    if (!_collection) {
        _collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:({
            HomeCollectionLayout *flow = [[HomeCollectionLayout alloc] init];
            flow;
        })];
        [_collection setShowsHorizontalScrollIndicator:NO];
        [_collection setDelegate:self];
        [_collection setDataSource:self];
        [_collection setBackgroundColor:kColor_BG];
        [_collection registerNib:[UINib nibWithNibName:@"HomeCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"HomeCollectionCell"];
        [self addSubview:_collection];
    }
    return _collection;
}

@end

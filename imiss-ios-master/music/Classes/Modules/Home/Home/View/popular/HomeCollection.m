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
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeCollection:didSelectItemAtIndexPath:cell:)]) {
        HomeCollectionCell *cell = (HomeCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [self.delegate homeCollection:self didSelectItemAtIndexPath:indexPath cell:cell];
    }
}

#pragma mark - get
- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
        _nameLab.textAlignment = NSTextAlignmentCenter;
        _nameLab.attributedText = ({
            // 居中样式
            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
            style.alignment = NSTextAlignmentCenter;
            
            // 阴影
            NSShadow *shadow = [[NSShadow alloc] init];
            shadow.shadowBlurRadius = 1.5;
            shadow.shadowOffset = CGSizeMake(0, 0);
            shadow.shadowColor = kColor_Text_Gary;
            
            
            NSString *str = @"497 Popular Music";
            NSMutableAttributedString *attrm = [[NSMutableAttributedString alloc] initWithString:str];
            [attrm addAttribute:NSFontAttributeName value:MathFont(14) range:NSMakeRange(0, str.length)];
            [attrm addAttribute:NSForegroundColorAttributeName value:kColor_Text_Gary range:NSMakeRange(0, 3)];
            [attrm addAttribute:NSForegroundColorAttributeName value:[kColor_Text_Gary colorWithAlphaComponent:0.5] range:NSMakeRange(3, str.length - 3)];
            [attrm addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, str.length)];
            [attrm addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(0, str.length)];
            attrm;
        });
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
- (UICollectionView *)collection {
    if (!_collection) {
        _collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:({
            CGFloat width = SCREEN_WIDTH - 80 + 10;
            HomeCollectionLayout *flow = [[HomeCollectionLayout alloc] init];
            flow.itemSize = CGSizeMake(width, 5 + width / 2 * 3 + 20);
            flow;
        })];
        [_collection setPagingEnabled:NO];
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

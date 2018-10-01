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
@interface HomeCollection()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    // 0-1: 显示动画   2: 不显示动画
    NSInteger _currentIndex;
}

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
    [view setClipsToBounds:NO];
    [view.layer setMasksToBounds:NO];
    return view;
}

#pragma mark - set
// 数据
- (void)setModel:(HomePupularListModel *)model {
    _model = model;
    [self setNameLabAttr:model.popular_count];
    [_collection reloadData];
}


- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(HomeCollectionCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_currentIndex < 2) {
        _currentIndex += 1;
    } else {
        return;
    }
    
    
    // 1. 隐藏Cell
    cell.content.alpha = 0;
    // 2. 控件
    UIView *view = ({
        UIView *view = [[UIView alloc] initWithFrame:cell.content.frame];
        [view setHeight:view.height + 14];
        [view setBackgroundColor:[UIColor whiteColor]];
        [cell addSubview:view];
        [cell bringSubviewToFront:view];
        view;
    });
    // 3. 比例
    POPBasicAnimation *basic1 = ({
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        basic.beginTime = CACurrentMediaTime();
        basic.fromValue = @(CGPointMake(0.0, 0.0));
        basic.toValue   = @(CGPointMake(1.0, 1.0));
        basic.duration  = 0.8f;
        basic;
    });
    [view.layer pop_addAnimation:basic1 forKey:@"basic1"];
    
    // 4. 比例动画完成
    [basic1 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [cell sendSubviewToBack:view];
        [cell.content setTransform:CGAffineTransformMakeScale(3.0, 3.0)];
        
        // 5. 透明度
        POPBasicAnimation *basic2 = ({
            POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
            basic.beginTime = CACurrentMediaTime();
            basic.fromValue = @(0);
            basic.toValue   = @(1);
            basic.duration  = 0.8f;
            basic;
        });
        [cell.content pop_addAnimation:basic2 forKey:@"basic2"];
        
        // 6. 比例
        POPBasicAnimation *basic3 = ({
            POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
            basic.beginTime = CACurrentMediaTime() + 0.1f;
            basic.fromValue = @(CGPointMake(3.0, 3.0));
            basic.toValue   = @(CGPointMake(1.0, 1.0));
            basic.duration  = 0.7f;
            basic;
        });
        [cell.content pop_addAnimation:basic3 forKey:@"basic3"];
        
        [basic3 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            [view removeFromSuperview];
        }];
    }];
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _model.song.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionCell *cell = [HomeCollectionCell loadItem:collectionView index:indexPath];
    cell.model = self.model.song[indexPath.row];
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
//        [_collection setClipsToBounds:NO];
        [_collection setAllowNight:YES];
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

// 受欢迎文本
- (void)setNameLabAttr:(NSString *)string {
    _nameLab.attributedText = ({
        // 居中样式
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        
        // 阴影
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowBlurRadius = 1.5;
        shadow.shadowOffset = CGSizeMake(0, 0);
        shadow.shadowColor = kColor_Text_Gary;
        
        NSString *str = [NSString stringWithFormat:@"%@ Popular Music", string];
        NSMutableAttributedString *attrm = [[NSMutableAttributedString alloc] initWithString:str];
        [attrm addAttribute:NSFontAttributeName value:MathFont(14) range:NSMakeRange(0, str.length)];
        [attrm addAttribute:NSForegroundColorAttributeName value:kColor_Text_Gary range:NSMakeRange(0, string.length)];
        [attrm addAttribute:NSForegroundColorAttributeName value:[kColor_Text_Gary colorWithAlphaComponent:0.5] range:NSMakeRange(string.length, str.length - string.length)];
        [attrm addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, str.length)];
        [attrm addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(0, str.length)];
        attrm;
    });
}

@end

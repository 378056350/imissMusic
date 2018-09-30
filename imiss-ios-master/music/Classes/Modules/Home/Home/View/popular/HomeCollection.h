//
//  HomeCollection.h
//  music
//
//  Created by 郑业强 on 2018/9/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCollectionCell.h"
#import "HomePupularModel.h"

#pragma mark - 代理
@class HomeCollection;
@protocol HomeCollectionDelegate<NSObject>

@optional
- (void)homeCollection:(HomeCollection *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath cell:(HomeCollectionCell *)cell;

@end


#pragma mark - 声明
@interface HomeCollection : BaseView

@property (nonatomic, weak  ) id<HomeCollectionDelegate> delegate;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) HomePupularListModel *model;

+ (instancetype)initWithFrame:(CGRect)frame;

@end

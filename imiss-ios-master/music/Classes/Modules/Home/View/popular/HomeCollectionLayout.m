//
//  HomeCollectionLayout.m
//  music
//
//  Created by 郑业强 on 2018/9/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionLayout.h"

#pragma mark - 声明
@interface HomeCollectionLayout()

@end

#pragma mark - 实现
@implementation HomeCollectionLayout

- (instancetype)init {
    if (self = [super init]) {
        CGFloat width = (SCREEN_WIDTH - 80);
        self.itemSize = CGSizeMake(width + 10, 5 + width / 2 * 3 + 20);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 20;
    }
    return self;
}

@end

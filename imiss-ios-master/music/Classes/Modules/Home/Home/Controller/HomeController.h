//
//  HomeController.h
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeCollectionCell.h"
#import "HomeTitle.h"
#import "HomeCollection.h"
#import "PupularModel.h"

@interface HomeController : BaseViewController

@property (nonatomic, strong) HomeCollectionCell *selectCell;   // 当前选中Cell
@property (nonatomic, strong) HomeTitle *header;                // 头视图
@property (nonatomic, strong) HomeCollection *collection;       // 列表
@property (nonatomic, strong) HomePupularListModel *model;      // 数据

@end

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

@interface HomeController : BaseViewController

@property (nonatomic, strong) HomeCollectionCell *selectCell;
@property (nonatomic, strong) HomeTitle *header;
@property (nonatomic, strong) HomeCollection *collection;

@end

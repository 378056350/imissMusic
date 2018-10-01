//
//  DetailController.h
//  music
//
//  Created by 郑业强 on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseViewController.h"
#import "DetailCard.h"
#import "SongModel.h"

@interface DetailController : BaseViewController

@property (nonatomic, strong) DetailCard *contentV;
@property (nonatomic, strong) SongModel *model;

- (void)show;
- (void)hide;

@end

//
//  DetailController.h
//  music
//
//  Created by 郑业强 on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseViewController.h"
#import "DetailCard.h"

@interface DetailController : BaseViewController

@property (nonatomic, strong) DetailCard *contentV;

- (void)show;
- (void)hide;

@end

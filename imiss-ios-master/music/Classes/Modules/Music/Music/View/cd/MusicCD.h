//
//  MusicCD.h
//  music
//
//  Created by 郑业强 on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "HomePupularModel.h"

@interface MusicCD : BaseView

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *detailLab;

@property (nonatomic, strong) HomeSongModel *model;

@end

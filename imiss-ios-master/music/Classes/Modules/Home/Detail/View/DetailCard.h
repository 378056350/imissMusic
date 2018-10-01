//
//  DetailCard.h
//  music
//
//  Created by zhongke on 2018/9/29.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "SongModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailCard : BaseView

@property (weak, nonatomic) IBOutlet UIView *maskView;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@property (weak, nonatomic) IBOutlet UIView *scrollContentView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@property (weak, nonatomic) IBOutlet UILabel *contentDescLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;

@property (nonatomic, strong) SongModel *model;

- (void)show;
- (void)hide;

@end

NS_ASSUME_NONNULL_END

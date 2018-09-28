//
//  HomeCollectionCell.h
//  music
//
//  Created by 郑业强 on 2018/9/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseCollectionCell.h"

@interface HomeCollectionCell : BaseCollectionCell

@property (weak, nonatomic) IBOutlet UIView *content;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@end

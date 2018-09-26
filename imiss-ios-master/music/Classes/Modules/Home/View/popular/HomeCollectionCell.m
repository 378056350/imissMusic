//
//  HomeCollectionCell.m
//  music
//
//  Created by 郑业强 on 2018/9/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionCell.h"

#pragma mark - 声明
@interface HomeCollectionCell()

@property (weak, nonatomic) IBOutlet UIView *content;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;

// 喜欢
@property (weak, nonatomic) IBOutlet UIView *likeV;
@property (weak, nonatomic) IBOutlet UIImageView *likeIcon;
@property (weak, nonatomic) IBOutlet UILabel *likeLab;

// 音乐
@property (weak, nonatomic) IBOutlet UIView *musicV;
@property (weak, nonatomic) IBOutlet UIImageView *musicIcon;
@property (weak, nonatomic) IBOutlet UILabel *musicLab;

// 列表
@property (weak, nonatomic) IBOutlet UIView *listV;
@property (weak, nonatomic) IBOutlet UIImageView *listIcon;
@property (weak, nonatomic) IBOutlet UILabel *listLab;

@end

#pragma mark - 实现
@implementation HomeCollectionCell

- (void)initUI {
    self.content.layer.shadowColor = kColor_Text_Gary.CGColor;
    self.content.layer.shadowOffset = CGSizeMake(0, 5);
    self.content.layer.shadowRadius = 5;
    self.content.layer.shadowOpacity = 0.2;
    
    self.nameLab.font = [UIFont systemFontOfSize:AdjustFont(18)];
    self.nameLab.textColor = kColor_Text_Black;
    self.detailLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.detailLab.textColor = kColor_Text_Gary;
    
    self.playBtn.layer.cornerRadius = self.playBtn.height / 2;
    self.playBtn.layer.shadowColor = kColor_Text_Gary.CGColor;
    self.playBtn.layer.shadowOffset = CGSizeMake(0, 5);
    self.playBtn.layer.shadowRadius = 5;
    self.playBtn.layer.shadowOpacity = 0.2;
    
    self.likeLab.font = [UIFont systemFontOfSize:AdjustFont(12)];
    self.musicLab.font = [UIFont systemFontOfSize:AdjustFont(12)];
    self.listLab.font = [UIFont systemFontOfSize:AdjustFont(12)];
    self.likeLab.textColor = kColor_Text_Gary;
    self.musicLab.textColor = kColor_Text_Gary;
    self.listLab.textColor = kColor_Text_Gary;
}

@end

//
//  HomeCollectionCell.m
//  music
//
//  Created by 郑业强 on 2018/9/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionCell.h"
#import "MusicController.h"

#pragma mark - 声明
@interface HomeCollectionCell()

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

@property (nonatomic, strong) MusicModules *modules;

@end

#pragma mark - 实现
@implementation HomeCollectionCell

- (void)initUI {
    self.content.layer.shadowColor = kColor_Text_Gary.CGColor;
    self.content.layer.shadowOffset = CGSizeMake(0, 5);
    self.content.layer.shadowRadius = 5;
    self.content.layer.shadowOpacity = 0.2;
    
    self.nameLab.font = MathFont(18);
//    self.nameLab.textColor = kColor_Text_Black;
    self.detailLab.font = MathFont(14);
    self.detailLab.textColor = kColor_Text_Gary;
    
    self.playBtn.layer.cornerRadius = self.playBtn.height / 2;
    self.playBtn.layer.shadowColor = kColor_Text_Gary.CGColor;
    self.playBtn.layer.shadowOffset = CGSizeMake(0, 5);
    self.playBtn.layer.shadowRadius = 5;
    self.playBtn.layer.shadowOpacity = 0.2;
    
    self.likeLab.font = MathFont(12);
    self.musicLab.font = MathFont(12);
    self.listLab.font = MathFont(12);
    self.likeLab.textColor = kColor_Text_Gary;
    self.musicLab.textColor = kColor_Text_Gary;
    self.listLab.textColor = kColor_Text_Gary;
    
    self.allowNight = YES;
    self.contentView.allowNight = YES;
//    self.nameLab.allowNight = YES;
    self.detailLab.allowNight = YES;
    self.content.allowNight = YES;
    
    self.themeMap = @{kThemeKeyNightBackNormalColor: HexColor(@"#201523")};
    
    [self.nameLab setThemeMap:@{
                                kThemeKeyLightTitleNormalColor: kColor_Text_Black,
                                kThemeKeyNightTitleNormalColor: kColor_Text_Light
                                }];
    
}
// 播放
- (IBAction)playClick:(UIButton *)sender {
    HomeController *homeVC = (HomeController *)self.viewController;
    homeVC.selectCell = self;
    
    [[MusicModules shareMusicModules] setMusicId:homeVC.selectCell.model.ID];
    
    MusicController *vc = [[MusicController alloc] init];
    [vc setModel:homeVC.selectCell.model];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

#pragma mark - set
// 数据
- (void)setModel:(SongModel *)model {
    _model = model;
    [_icon sd_setImageWithURL:[NSURL URLWithString:KStatic(model.big_img)]];
    [_nameLab setText:model.name];
    [_detailLab setText:model.author];
    [_likeLab setText:[NSString getMeasureThousand:[model.likeNumber doubleValue]]];
    [_musicLab setText:[NSString getMeasureThousand:[model.listenNumber doubleValue]]];
    [_listLab setText:[NSString getMeasureThousand:[model.shareNumber doubleValue]]];
    
    // 播放中
    if ([self.modules isPlaying] == YES && [self.modules.musicId isEqualToString:model.ID]) {
        // 暂停
        [_playBtn setImage:[UIImage imageNamed:@"home_pause"] forState:UIControlStateNormal];
        [_playBtn setImage:[UIImage imageNamed:@"home_pause"] forState:UIControlStateHighlighted];
    }
    // 暂停中
    else {
        // 播放
        [_playBtn setImage:[UIImage imageNamed:@"home_play"] forState:UIControlStateNormal];
        [_playBtn setImage:[UIImage imageNamed:@"home_play"] forState:UIControlStateHighlighted];
    }
}
- (MusicModules *)modules {
    if (!_modules) {
        _modules = [MusicModules shareMusicModules];
    }
    return _modules;
}

@end

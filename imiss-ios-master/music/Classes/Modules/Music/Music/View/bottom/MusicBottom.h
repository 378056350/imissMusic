//
//  MusicBottom.h
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "MusicModules.h"
#import "ResourceModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MusicBottom : BaseView

@property (weak, nonatomic) IBOutlet UIButton *cycleBtn;    // 循环
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;     // 上一首
@property (weak, nonatomic) IBOutlet UIButton *controlBtn;  // 控制
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;    // 下一首
@property (weak, nonatomic) IBOutlet UIButton *randomBtn;   // 随机
@property (weak, nonatomic) IBOutlet UIButton *listBtn;     // 列表
@property (weak, nonatomic) IBOutlet UIImageView *controlImg;   // 控制图片

@property (nonatomic, strong) ResourceModel *model;         // 数据

// 播放中
- (void)music:(MusicModules *)manager playing:(NSString *)music progress:(CGFloat)progress currentTime:(NSTimeInterval)currentTime totalTime:(NSTimeInterval)totalTime;

@end

NS_ASSUME_NONNULL_END

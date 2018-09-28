//
//  MusicBottom.h
//  music
//
//  Created by zhongke on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MusicBottom : BaseView

@property (weak, nonatomic) IBOutlet UIButton *cycleBtn;    // 循环
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;     // 上一首
@property (weak, nonatomic) IBOutlet UIButton *controlBtn;  // 控制
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;    // 下一首
@property (weak, nonatomic) IBOutlet UIButton *randomBtn;   // 随机
@property (weak, nonatomic) IBOutlet UIButton *listBtn;     // 列表

@end

NS_ASSUME_NONNULL_END

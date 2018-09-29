//
//  KKScreenShotContent.h
//  music
//
//  Created by zhongke on 2018/9/29.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKScreenShotContent : BaseView

@property (weak, nonatomic) IBOutlet UIImageView *screenShot;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@end

NS_ASSUME_NONNULL_END

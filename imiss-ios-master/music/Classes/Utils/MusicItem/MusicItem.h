//
//  PlayItem.h
//  imiss
//
//  Created by MAC on 2018/8/29.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicItemConst.h"

#pragma mark - typedef
typedef void (^MusicItemClick)(void);

#pragma mark - 声明
@interface MusicItem : UIButton

@property (nonatomic, copy  ) MusicItemClick click;

- (UIBarButtonItem *)getBarItem;

@end

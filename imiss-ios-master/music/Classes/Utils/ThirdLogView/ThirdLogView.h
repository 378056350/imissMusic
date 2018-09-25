//
//  ThirdLogView.h
//  imiss
//
//  Created by 郑业强 on 2018/8/14.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - block
typedef void (^ThirdLogViewEvent)(NSInteger index);

#pragma mark - 声明
@interface ThirdLogView : BaseView

@property (nonatomic, copy  ) ThirdLogViewEvent event;

@end

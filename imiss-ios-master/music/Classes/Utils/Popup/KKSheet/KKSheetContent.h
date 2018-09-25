//
//  KKSheetContent.h
//  imiss
//
//  Created by 郑业强 on 2018/9/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - typedef
typedef void (^KKSheetContentClick)(NSInteger index);

#pragma mark - 声明
@interface KKSheetContent : BaseView

@property (nonatomic, copy  ) KKSheetContentClick click;

@end

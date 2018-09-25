//
//  KKSheet.h
//  imiss
//
//  Created by 郑业强 on 2018/9/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKPopupView.h"
#import "KKSheetContent.h"

#pragma mark - 声明
@interface KKSheet : KKPopupView

@property (nonatomic, strong) KKSheetContent *contentv;

+ (instancetype)init;

@end

//
//  KKShare.h
//  imiss
//
//  Created by 郑业强 on 2018/9/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKPopupView.h"
#import "KKShareContent.h"

#pragma mark - 声明
@interface KKShare : KKPopupView

@property (nonatomic, strong) KKShareContent *contentv;

+ (instancetype)init;

@end

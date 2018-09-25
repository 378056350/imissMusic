//
//  BaseItem.h
//  imiss
//
//  Created by 郑业强 on 2018/8/23.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - NS_ENUM
typedef NS_ENUM(NSUInteger, BaseItemStatus) {
    BaseItemStatusTextLeft,       // 文字在左
    BaseItemStatusTextTop,        // 文字在上
    BaseItemStatusTextRight,      // 文字在右
    BaseItemStatusTextBottom,     // 文字在下
    BaseItemStatusTextOnly,       // 只有文字
    BaseItemStatusIconOnly,       // 只有图片
};

#pragma mark - 声明
@interface BaseItem : UIButton

// 样式
@property (nonatomic, assign) BaseItemStatus status;
// 文字
@property (nonatomic, strong) NSString *name;
// 图片
@property (nonatomic, strong) NSString *icon;

@end

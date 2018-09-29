//
//  KKEmptyView.h
//  music
//
//  Created by zhongke on 2018/9/29.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - ENUM
// 状态
typedef NS_ENUM(NSInteger, KKEmptyStatus) {
    KKEmptyStatusLoading,
    KKEmptyStatusSuccess,
    KKEmptyStatusError,
};
// 样式
typedef NS_ENUM(NSInteger, KKEmptyStyle) {
    KKEmptyStyleDefault,    // 默认样式
};


#pragma mark - 声明
@interface KKEmptyView : UIView

@property (nonatomic, assign) KKEmptyStyle style;
@property (nonatomic, assign) KKEmptyStatus status;

@end

NS_ASSUME_NONNULL_END

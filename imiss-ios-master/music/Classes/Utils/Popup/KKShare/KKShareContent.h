//
//  KKShareContent.h
//  imiss
//
//  Created by 郑业强 on 2018/9/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - typedef
// 点击Block
typedef void (^KKShareClickBlock)(NSInteger index);
// 成功Block
typedef void (^KKShareSuccessBlock)(void);
// 失败Block
typedef void (^KKShareErrorBlock)(NSInteger code);

#pragma mark - 声明
@interface KKShareContent : BaseView

@property (nonatomic, copy  ) NSString *title;
@property (nonatomic, copy  ) NSString *desc;
@property (nonatomic, copy  ) NSString *url;
@property (nonatomic, copy  ) NSString *thumb;

@property (nonatomic, copy  ) KKShareClickBlock clickBlock;
@property (nonatomic, copy  ) KKShareSuccessBlock successBlock;
@property (nonatomic, copy  ) KKShareErrorBlock errorBlock;
@property (weak, nonatomic) IBOutlet UIButton *cancleBtn;

@end

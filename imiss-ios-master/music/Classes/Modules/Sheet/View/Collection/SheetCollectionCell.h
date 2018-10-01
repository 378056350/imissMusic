//
//  SheetCollectionCell.h
//  music
//
//  Created by zhongke on 2018/9/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseCollectionCell.h"
#import "SheetModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SheetCollectionCell : BaseCollectionCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIImageView *cd;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cdConstraintL;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) SheetModel *model;

- (void)show:(BOOL)animation;
- (void)hide:(BOOL)animation;

@end

NS_ASSUME_NONNULL_END

//
//  KKShareContent.m
//  imiss
//
//  Created by 郑业强 on 2018/9/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKShareContent.h"
#import "KKSheetCell.h"
#import "UIView+BorderLine.h"

#pragma mark - 声明
@interface KKShareContent()

@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end

#pragma mark - 实现
@implementation KKShareContent

#pragma mark - 声明
- (void)initUI {
    [self setBackgroundColor:kColor_BG];
    [self createScrollItem];
    [self.cancleBtn.titleLabel setFont:[UIFont systemFontOfSize:AdjustFont(12)]];
    [self.cancleBtn setTitleColor:kColor_Text_Gary forState:UIControlStateNormal];
    [self.cancleBtn setTitleColor:kColor_Text_Gary forState:UIControlStateHighlighted];
    [self.cancleBtn borderForColor:[kColor_Text_Gary colorWithAlphaComponent:0.2] borderWidth:1.f / [UIScreen mainScreen].scale borderType:UIBorderSideTypeTop];
    [self setRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight radius:5];
}

- (void)createScrollItem {
    NSArray<NSArray *> *arr = @[@[@"cm2_blogo_pyq", @"cm2_blogo_weixin", @"cm2_blogo_qzone",
                                  @"cm2_blogo_qq", @"cm2_blogo_sina", @"cm2_blogo_yxq",
                                  @"cm2_blogo_yixin", @"cm2_blogo_copylink"],
                                @[@"微信朋友圈", @"微信好友", @"QQ空间",
                                  @"QQ好友", @"微博", @"易信朋友圈",
                                  @"易信好友", @"复制链接"],
                                @[@"微信", @"微信", @"QQ",
                                  @"QQ", @"微博", @"易信",
                                  @"易信", @"复制链接"],
                                @[@(UMSocialPlatformType_WechatTimeLine),
                                  @(UMSocialPlatformType_WechatSession),
                                  @(UMSocialPlatformType_Qzone),
                                  @(UMSocialPlatformType_QQ),
                                  @(UMSocialPlatformType_Sina),
                                  @(UMSocialPlatformType_YixinTimeLine),
                                  @(UMSocialPlatformType_YixinSession)]];
    for (int i=0; i<arr[0].count; i++) {
        UIView *view = [[UIView alloc] initWithFrame:({
            CGFloat width = SCREEN_WIDTH / 4.5;
            CGFloat left = i * width;
            CGFloat height = self.height - 45 - SafeAreaBottomHeight;
            CGFloat top = 0;
            CGRectMake(left, top, width, height);
        })];
        [self.scroll addSubview:view];
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:({
            CGRectMake(0, 10, view.width / 2, view.height / 2);
        })];
        [icon setCenterX:view.width / 2];
        [icon setContentMode:UIViewContentModeScaleAspectFit];
        [icon setImage:[UIImage imageNamed:arr[0][i]]];
        [view addSubview:icon];
        
        UILabel *lab = [[UILabel alloc] initWithFrame:({
            CGRectMake(0, CGRectGetMaxY(icon.frame), view.width, 20);
        })];
        [lab setTextAlignment:NSTextAlignmentCenter];
        [lab setFont:[UIFont systemFontOfSize:AdjustFont(10)]];
        [lab setTextColor:kColor_Text_Gary];
        [lab setText:arr[1][i]];
        [view addSubview:lab];
        
        __weak typeof(self) weak = self;
        [view addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            // 回调
            if (weak.clickBlock) {
                weak.clickBlock(i);
            }
            KKShare *share = (KKShare *)weak.superview;
            [share hide];
            // 不是复制链接
            if (i != arr[0].count - 1) {
                // 分享
                UIImage *thumb = [UIImage imageNamed:_thumb];
                [UMSocialManager shareUrl:[arr[3][i] integerValue] url:_url title:_title desc:_desc thumbImage:thumb success:^{
                    // 回调
                    if (weak.successBlock) {
                        weak.successBlock();
                    }
                } error:^(NSInteger code) {
                    // 提示
                    NSString *str = [NSString stringWithFormat:@"尚未安装%@, 请安装%@后再试.", arr[2][i], arr[2][i]];
                    [weak showWindowTextHUD:str];
                    // 回调
                    if (weak.errorBlock) {
                        weak.errorBlock(code);
                    }
                }];
            }
            // 复制链接
            else {
                // 复制链接
                UIPasteboard *pab = [UIPasteboard generalPasteboard];
                [pab setString:weak.url];
                // 失败
                if (pab == nil) {
                    [weak showWindowErrorHUD:@"复制链接失败" delay:1];
                }
                // 成功
                else {
                    [weak showWindowSuccessHUD:@"复制链接成功" delay:1];
                }
            }
        }];
        
        [_scroll setContentSize:CGSizeMake(CGRectGetMaxX(view.frame), 0)];
    }
}

@end


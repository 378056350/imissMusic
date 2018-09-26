//
//  BaseTabBar.m
//  weibo-OC
//
//  Created by Oboe_b on 16/8/29.
//  Copyright © 2016年 Oboe_b. All rights reserved.
//

#import "BaseTabBar.h"
#import "UIView+BorderLine.h"

@interface BaseTabBar ()

@property (strong, nonatomic) UIButton *composeButton;
@property (nonatomic, strong) NSMutableArray *views;

@end

@implementation BaseTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self setShadowLine:kColor_BG];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [obj removeFromSuperview];
            [obj setAlpha:0];
        }
    }
    
    
    [self views];
}

#pragma mark - set
- (void)setShadowLine:(UIColor *)color {
    // 改变tabbar 线条颜色
    [self setShadowImage:({
        CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, 1);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        img;
    })];
    [self setBackgroundImage:[[UIImage alloc] init]];
}

#pragma mark - get
- (NSMutableArray *)views {
    if (!_views) {
        _views = [[NSMutableArray alloc] init];
        
        NSArray<NSArray *> *image = @[
                                      @[@"首页",@"我的",@"账户"],
                                      @[@"cm4_btm_icn_discovery",@"cm4_btm_icn_music_new",@"cm4_btm_icn_account"],
                                      @[@"cm4_btm_icn_discovery_prs",@"cm4_btm_icn_music_new_prs",@"cm4_btm_icn_account_prs"]
                                      ];
        NSInteger current = 0;
        NSInteger count = [image[0] count];
        for (int i=0; i<count; i++) {
            CGFloat width = SCREEN_WIDTH / count;
            UIImageView *icon = ({
                UIImageView *icon = [[UIImageView alloc] initWithFrame:({
                    CGRectMake((width - 22) / 2, (49 - 30) / 2, 22, 30);
                })];
                icon.image = [UIImage imageNamed:current == i ? image[2][i] : image[1][i]];
                icon.contentMode = UIViewContentModeScaleAspectFit;
                icon.tag = 10;
                icon;
            });
            
            UIView *item = ({
                UIView *item = [[UIView alloc] initWithFrame:({
                    CGFloat left = width * i;
                    CGRectMake(left, 0, width, 49);
                })];
                [item addSubview:icon];
                item;
            });
            [self addSubview:item];
            [_views addObject:item];
            
            [item addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
                for (int y=0; y<self.views.count; y++) {
                    UIView *subview = self.views[y];
                    UIImageView *subicon = [subview viewWithTag:10];
                    subicon.image = [UIImage imageNamed:y == i ? image[2][y] : image[1][y]];
                    
                }
                if (_click) {
                    _click(i);
                }
            }];
        }
    }
    return _views;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

//
//  UIView+UIConfig.m
//  imiss
//
//  Created by 郑业强 on 2018/9/16.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+UIConfig.h"

static void *kUIView_ThemeMap;
static void *kUIView_AllowNight;
static BOOL _isNight;
static NSDictionary *defaultMap;

#pragma mark - 实现
@implementation UIView (UIConfig)

#pragma mark - runtime
+ (void)load {
    //方法交换应该被保证，在程序中只会执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // initWithFrame
        [self exchange:@selector(initWithFrame:) sel2:@selector(swiz_initWithFrame:)];
        // initWithCoder
        [self exchange:@selector(initWithCoder:) sel2:@selector(swiz_initWithCoder:)];
        // init
        [self exchange:@selector(init) sel2:@selector(swiz_init)];
        
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ThemeConfig" ofType:@"plist"];
        defaultMap = [NSDictionary dictionaryWithContentsOfFile:filePath];
    });
}
+ (void)exchange:(SEL)sel1 sel2:(SEL)sel2 {
    SEL systemSel = sel1;
    SEL swizzSel = sel2;
    // 两个方法的Method
    Method systemMethod = class_getInstanceMethod([self class], systemSel);
    Method swizzMethod = class_getInstanceMethod([self class], swizzSel);
    // 首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
    BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
    // 如果成功，说明类中不存在这个方法的实现
    if (isAdd) {
        // 将被交换方法的实现替换到这个并不存在的实现
        class_replaceMethod(self, swizzSel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }
    // 否则，交换两个方法的实现
    else {
        method_exchangeImplementations(systemMethod, swizzMethod);
    }
}
- (instancetype)swiz_initWithFrame:(CGRect)frame {
    id obj = [self swiz_initWithFrame:frame];
    [self setAllowNight:NO];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheme) name:kThemeDidChangeNotification object:nil];
    [self changeTheme];
    return obj;
}
- (instancetype)swiz_initWithCoder:(NSCoder *)aDecoder {
    id obj = [self swiz_initWithCoder:aDecoder];
    [self setAllowNight:NO];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheme) name:kThemeDidChangeNotification object:nil];
    [self changeTheme];
    return obj;
}
- (instancetype)swiz_init {
    id obj = [self swiz_init];
    [self setAllowNight:NO];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheme) name:kThemeDidChangeNotification object:nil];
    [self changeTheme];
    return obj;
}

#pragma mark - get / set
- (void)setNight:(BOOL)night {
    _isNight = night;
}
- (BOOL)isNight {
    return _isNight;
}

#pragma mark - 主题改变
- (void)themeChanged {
    [self setNight:!_isNight];
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNotification object:nil];
}
- (void)changeTheme {
    [self theme_view];
    [self theme_label];
    [self theme_button];
    [self theme_tableCell];
    [self theme_tableView];
    [self theme_sw];
    [self theme_image];
    [self theme_tabbar];
    [self theme_textfield];
    [self theme_refreshHeader];
}

#pragma mark - objc
// 自定义主题颜色
- (void)setThemeMap:(NSDictionary *)themeMap {
    objc_setAssociatedObject(self, &kUIView_ThemeMap, themeMap, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self changeTheme];
}
- (NSDictionary *)themeMap {
    return objc_getAssociatedObject(self, &kUIView_ThemeMap);
}
// 夜间模式是否开启
- (void)setAllowNight:(BOOL)allowNight {
    objc_setAssociatedObject(self, &kUIView_AllowNight, @(allowNight), OBJC_ASSOCIATION_ASSIGN);
    [self changeTheme];
}
- (BOOL)isAllowNight {
    return [objc_getAssociatedObject(self, &kUIView_AllowNight) boolValue];
}

#pragma mark - 控件设置
- (void)theme_view {
    NSDictionary *map = self.themeMap;
    // UIView
    if ([self isKindOfClass:[UIView class]]) {
        UIView *obj = (UIView *)self;
        // 白天模式
        if (_isNight == NO) {
            if (map[kThemeKeyLightBackNormalColor]) {
                obj.backgroundColor = map[kThemeKeyLightBackNormalColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightBackNormalColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyLightBackNormalColor]);
            }
        }
        // 夜间模式
        else {
            if (map[kThemeKeyNightBackNormalColor]) {
                obj.backgroundColor = map[kThemeKeyNightBackNormalColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightBackNormalColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyNightBackNormalColor]);
            }
        }
    }
    
}
- (void)theme_label {
    // UILabel
    NSDictionary *map = self.themeMap;
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *obj = (UILabel *)self;
        // 白天
        if (_isNight == NO) {
            
            // 背景色
            if (map[kThemeKeyLightBackNormalColor]) {
                obj.backgroundColor = map[kThemeKeyLightBackNormalColor];
            }
            // 默认
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightBackNormalColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyLightBackNormalColor]);
            }
            
            // 文本
            if (map[kThemeKeyLightTitleNormalColor]) {
                obj.textColor = map[kThemeKeyLightTitleNormalColor];
                // 富文本
                if (obj.attributedText) {
                    obj.attributedText = ({
                        NSMutableAttributedString *attrm = [[NSMutableAttributedString alloc] initWithAttributedString:obj.attributedText];
                        [attrm addAttribute:NSForegroundColorAttributeName value:map[kThemeKeyLightTitleNormalColor] range:NSMakeRange(0, obj.attributedText.string.length)];
                        attrm;
                    });
                }
            }
            // 默认
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightTitleNormalColor]) {
                obj.textColor = HexColor(defaultMap[kThemeKeyLightTitleNormalColor]);
                // 富文本
                if (obj.attributedText) {
                    obj.attributedText = ({
                        NSMutableAttributedString *attrm = [[NSMutableAttributedString alloc] initWithAttributedString:obj.attributedText];
                        [attrm addAttribute:NSForegroundColorAttributeName value:HexColor(defaultMap[kThemeKeyLightTitleNormalColor]) range:NSMakeRange(0, obj.attributedText.string.length)];
                        attrm;
                    });
                }
            }
        }
        // 夜间模式
        else {
            // 背景色
            if (map[kThemeKeyNightBackNormalColor]) {
                obj.backgroundColor = map[kThemeKeyNightBackNormalColor];
            }
            // 默认
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightBackNormalColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyNightBackNormalColor]);
            }
            
            // 文本
            if (map[kThemeKeyNightTitleNormalColor]) {
                obj.textColor = map[kThemeKeyNightTitleNormalColor];
                // 富文本
                if (obj.attributedText) {
                    obj.attributedText = ({
                        NSMutableAttributedString *attrm = [[NSMutableAttributedString alloc] initWithAttributedString:obj.attributedText];
                        [attrm addAttribute:NSForegroundColorAttributeName value:map[kThemeKeyNightTitleNormalColor] range:NSMakeRange(0, obj.attributedText.string.length)];
                        attrm;
                    });
                }
            }
            // 默认
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightTitleNormalColor]) {
                obj.textColor = HexColor(defaultMap[kThemeKeyNightTitleNormalColor]);
                // 富文本
                if (obj.attributedText) {
                    obj.attributedText = ({
                        NSMutableAttributedString *attrm = [[NSMutableAttributedString alloc] initWithAttributedString:obj.attributedText];
                        [attrm addAttribute:NSForegroundColorAttributeName value:HexColor(defaultMap[kThemeKeyNightTitleNormalColor]) range:NSMakeRange(0, obj.attributedText.string.length)];
                        attrm;
                    });
                }
            }
        }
    }
}
- (void)theme_button {
    NSDictionary *map = self.themeMap;
    // UIButton
    if ([self isKindOfClass:[UIButton class]]) {
        UIButton *obj = (UIButton *)self;
        // 白天模式
        if (_isNight == NO) {
            // 背景色
            if (map[kThemeKeyLightBackNormalColor]) {
                [obj setBackgroundColor:map[kThemeKeyLightBackNormalColor]];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightBackNormalColor]) {
                [obj setBackgroundColor:HexColor(defaultMap[kThemeKeyLightBackNormalColor])];
            }
            
            // 文字普通
            if (map[kThemeKeyLightTitleNormalColor]) {
                [obj setTitleColor:map[kThemeKeyLightTitleNormalColor] forState:UIControlStateNormal];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightTitleNormalColor]) {
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [obj setTitleColor:HexColor(defaultMap[kThemeKeyLightTitleNormalColor]) forState:UIControlStateNormal];
//                });
            }
            
            // 文字高亮
            if (map[kThemeKeyLightTitleHighlightColor]) {
                [obj setTitleColor:map[kThemeKeyLightTitleHighlightColor] forState:UIControlStateHighlighted];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightTitleHighlightColor]) {
                [obj setTitleColor:HexColor(defaultMap[kThemeKeyLightTitleHighlightColor]) forState:UIControlStateHighlighted];
            }
            
            // 边框
            if (map[kThemeKeyLightSeparatorColor]) {
                [obj.layer setBorderColor:[map[kThemeKeyLightSeparatorColor] CGColor]];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightSeparatorColor]) {
                [obj.layer setBorderColor:[HexColor(defaultMap[kThemeKeyLightSeparatorColor]) CGColor]];
            }
            
            // 图片
            if (map[kThemeKeyLightNormalImage]) {
                [obj setImage:[UIImage imageNamed:map[kThemeKeyLightNormalImage]] forState:UIControlStateNormal];
            }
            if (map[kThemeKeyLightHighlightImage]) {
                [obj setImage:[UIImage imageNamed:map[kThemeKeyLightHighlightImage]] forState:UIControlStateHighlighted];
            }
        }
        // 夜间模式
        else {
            // 背景色
            if (map[kThemeKeyNightBackNormalColor]) {
                [obj setBackgroundColor:map[kThemeKeyNightBackNormalColor]];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightBackNormalColor]) {
                [obj setBackgroundColor:HexColor(defaultMap[kThemeKeyNightBackNormalColor])];
            }
            
            // 文字普通
            if (map[kThemeKeyNightTitleNormalColor]) {
                [obj setTitleColor:map[kThemeKeyNightTitleNormalColor] forState:UIControlStateNormal];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightTitleNormalColor]) {
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [obj setTitleColor:HexColor(defaultMap[kThemeKeyNightTitleNormalColor]) forState:UIControlStateNormal];
//                });
            }
            
            // 文字高亮
            if (map[kThemeKeyNightTitleHighNightColor]) {
                [obj setTitleColor:map[kThemeKeyNightTitleHighNightColor] forState:UIControlStateHighlighted];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightTitleHighNightColor]) {
                [obj setTitleColor:HexColor(defaultMap[kThemeKeyNightTitleHighNightColor]) forState:UIControlStateHighlighted];
            }
            
            // 边框
            if (map[kThemeKeyNightSeparatorColor]) {
                [obj.layer setBorderColor:[map[kThemeKeyNightSeparatorColor] CGColor]];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightSeparatorColor]) {
                [obj.layer setBorderColor:[HexColor(defaultMap[kThemeKeyNightSeparatorColor]) CGColor]];
            }
            
            // 图片
            if (map[kThemeKeyNightNormalImage]) {
                [obj setImage:[UIImage imageNamed:map[kThemeKeyNightNormalImage]] forState:UIControlStateNormal];
            }
            if (map[kThemeKeyNightHighNightImage]) {
                [obj setImage:[UIImage imageNamed:map[kThemeKeyNightHighNightImage]] forState:UIControlStateHighlighted];
            }
        }
    }
}
- (void)theme_tableCell {
    NSDictionary *map = self.themeMap;
    // UITableViewCell
    if ([self isKindOfClass:[UITableViewCell class]]) {
        UITableViewCell *obj = (UITableViewCell *)self;
        // 白天模式
        if (_isNight == NO) {
            // 背景
            if (map[kThemeKeyLightBackNormalColor]) {
                obj.backgroundColor = map[kThemeKeyLightBackNormalColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightBackNormalColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyLightBackNormalColor]);
            }
            
            NSLog(@"%@", defaultMap[kThemeKeyLightBackHighLightColor]);
            // 选中色
            if (map[kThemeKeyLightBackHighLightColor]) {
                obj.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
                obj.selectedBackgroundView.backgroundColor = map[kThemeKeyLightBackHighLightColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightBackHighLightColor]) {
                obj.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
                obj.selectedBackgroundView.backgroundColor = HexColor(defaultMap[kThemeKeyLightBackHighLightColor]);
            }
        }
        // 夜间模式
        else {
            // 背景
            if (map[kThemeKeyNightBackNormalColor]) {
                obj.backgroundColor = map[kThemeKeyNightBackNormalColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightBackNormalColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyNightBackNormalColor]);
            }
            
            // 选中色
            if (map[kThemeKeyNightBackHighNightColor]) {
                obj.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
                obj.selectedBackgroundView.backgroundColor = map[kThemeKeyNightBackHighNightColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightBackHighNightColor]) {
                obj.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
                obj.selectedBackgroundView.backgroundColor = HexColor(defaultMap[kThemeKeyNightBackHighNightColor]);
            }
        }
    }
}
- (void)theme_tableView {
    NSDictionary *map = self.themeMap;
    // 列表
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *obj = (UITableView *)self;
        // 白天模式
        if (_isNight == NO) {
            // 背景色
            if (map[kThemeKeyLightBackTableColor]) {
                obj.backgroundColor = map[kThemeKeyLightBackTableColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightBackTableColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyLightBackTableColor]);
            }
            
            // 线条色
            if (map[kThemeKeyLightSeparatorColor]) {
                obj.separatorColor = map[kThemeKeyLightSeparatorColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightSeparatorColor]) {
                obj.separatorColor = HexColor(defaultMap[kThemeKeyLightSeparatorColor]);
            }
        }
        // 夜间模式
        else {
            // 背景色
            if (map[kThemeKeyNightBackTableColor]) {
                obj.backgroundColor = map[kThemeKeyNightBackTableColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightBackTableColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyNightBackTableColor]);
            }
            
            // 线条色
            if (map[kThemeKeyNightSeparatorColor]) {
                obj.separatorColor = map[kThemeKeyNightSeparatorColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightSeparatorColor]) {
                obj.separatorColor = HexColor(defaultMap[kThemeKeyNightSeparatorColor]);
            }
        }
    }
}
- (void)theme_sw {
    NSDictionary *map = self.themeMap;
    // Switch
    if ([self isKindOfClass:[UISwitch class]]) {
        UISwitch *obj = (UISwitch *)self;
        // 白天模式
        if (_isNight == NO) {
            if (map[kThemeKeyLightBackNormalColor]) {
                obj.backgroundColor = map[kThemeKeyLightBackNormalColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightBackNormalColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyLightBackNormalColor]);
            }
            
            if (map[kThemeKeyLightSwThumbColor]) {
                obj.thumbTintColor = map[kThemeKeyLightSwThumbColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightSwThumbColor]) {
                obj.thumbTintColor = HexColor(defaultMap[kThemeKeyLightSwThumbColor]);
            }
            
            if (map[kThemeKeyLightSwOffColor]) {
                obj.onTintColor = map[kThemeKeyLightSwOffColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightSwOffColor]) {
                obj.onTintColor = HexColor(defaultMap[kThemeKeyLightSwOffColor]);
            }
            
            if (map[kThemeKeyLightSwOnColor]) {
                obj.tintColor = map[kThemeKeyLightSwOnColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightSwOnColor]) {
                obj.tintColor = HexColor(defaultMap[kThemeKeyLightSwOnColor]);
            }
        }
        // 夜间模式
        else {
            if (map[kThemeKeyNightBackNormalColor]) {
                obj.backgroundColor = map[kThemeKeyNightBackNormalColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightBackNormalColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyNightBackNormalColor]);
            }
            
            if (map[kThemeKeyNightSwThumbColor]) {
                obj.thumbTintColor = map[kThemeKeyNightSwThumbColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightSwThumbColor]) {
                obj.thumbTintColor = HexColor(defaultMap[kThemeKeyNightSwThumbColor]);
            }
            
            if (map[kThemeKeyNightSwOffColor]) {
                obj.onTintColor = map[kThemeKeyNightSwOffColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightSwOffColor]) {
                obj.onTintColor = HexColor(defaultMap[kThemeKeyNightSwOffColor]);
            }
            
            if (map[kThemeKeyNightSwOnColor]) {
                obj.tintColor = map[kThemeKeyNightSwOnColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightSwOnColor]) {
                obj.tintColor = HexColor(defaultMap[kThemeKeyNightSwOnColor]);
            }
        }
    }
}
- (void)theme_image {
    // UIImage
    NSDictionary *map = self.themeMap;
    if ([self isKindOfClass:[UIImageView class]]) {
        UIImageView *obj = (UIImageView *)self;
        // 白天模式
        if (_isNight == NO) {
            if (map[kThemeKeyLightNormalImage]) {
                obj.image = [UIImage imageNamed:map[kThemeKeyLightNormalImage]];
            }
        }
        // 夜间模式
        else {
            if (map[kThemeKeyNightNormalImage]) {
                obj.image = [UIImage imageNamed:map[kThemeKeyNightNormalImage]];
            }
        }
    }
}
- (void)theme_tabbar {
    NSDictionary *map = self.themeMap;
    // UITabbar
    if ([self isKindOfClass:[UITabBar class]]) {
        UITabBar *obj = (UITabBar *)self;
        // 白天模式
        if (_isNight == NO) {
            if (map[kThemeKeyLightBackNormalColor]) {
                obj.backgroundColor = map[kThemeKeyLightBackNormalColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightBackNormalColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyLightBackNormalColor]);
            }
        }
        // 夜间模式
        else {
            if (map[kThemeKeyNightBackNormalColor]) {
                obj.backgroundColor = map[kThemeKeyNightBackNormalColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightBackNormalColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyNightBackNormalColor]);
            }
        }
    }
}
- (void)theme_textfield {
    NSDictionary *map = self.themeMap;
    // UITextField
    if ([self isKindOfClass:[UITextField class]]) {
        UITextField *obj = (UITextField *)self;
        // 白天模式
        if (_isNight == NO) {
            if (map[kThemeKeyLightBackNormalColor]) {
                obj.backgroundColor = map[kThemeKeyLightBackNormalColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightBackNormalColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyLightBackNormalColor]);
            }
            
            if (map[kThemeKeyLightTitleNormalColor]) {
                obj.textColor = map[kThemeKeyLightTitleNormalColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightTitleNormalColor]) {
                obj.textColor = HexColor(defaultMap[kThemeKeyLightTitleNormalColor]);
            }
            
            if (map[kThemeKeyLightPlaceholderColor]) {
                [obj setValue:map[kThemeKeyLightPlaceholderColor] forKeyPath:@"_placeholderLabel.textColor"];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyLightPlaceholderColor]) {
                [obj setValue:HexColor(defaultMap[kThemeKeyLightPlaceholderColor]) forKeyPath:@"_placeholderLabel.textColor"];
            }
        }
        // 夜间模式
        else {
            if (map[kThemeKeyNightBackNormalColor]) {
                obj.backgroundColor = map[kThemeKeyNightBackNormalColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightBackNormalColor]) {
                obj.backgroundColor = HexColor(defaultMap[kThemeKeyNightBackNormalColor]);
            }
            
            if (map[kThemeKeyNightTitleNormalColor]) {
                obj.textColor = map[kThemeKeyNightTitleNormalColor];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightTitleNormalColor]) {
                obj.textColor = HexColor(defaultMap[kThemeKeyNightTitleNormalColor]);
            }
            
            if (map[kThemeKeyNightPlaceholderColor]) {
                [obj setValue:map[kThemeKeyNightPlaceholderColor] forKeyPath:@"_placeholderLabel.textColor"];
            }
            else if (self.allowNight == YES && defaultMap[kThemeKeyNightPlaceholderColor]) {
                [obj setValue:HexColor(defaultMap[kThemeKeyNightPlaceholderColor]) forKeyPath:@"_placeholderLabel.textColor"];
            }
        }
    }
}
- (void)theme_refreshHeader {
    // UITabbar
    if ([self isKindOfClass:[MJRefreshNormalHeader class]]) {
        MJRefreshNormalHeader *obj = (MJRefreshNormalHeader *)self;
        // 白天模式
        if (_isNight == NO) {
            obj.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
            obj.arrowView.image = [UIImage imageNamed:@"arrow_gray"];
            obj.arrowView.contentMode = UIViewContentModeScaleAspectFit;
        }
        // 夜间模式
        else {
            obj.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
            obj.arrowView.image = [UIImage imageNamed:@"arrow_white"];
            obj.arrowView.contentMode = UIViewContentModeScaleAspectFit;
        }
    }
}



@end



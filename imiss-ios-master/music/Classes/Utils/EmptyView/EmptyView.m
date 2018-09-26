//
//  EmptyView.m
//  imiss
//
//  Created by 郑业强 on 2018/8/13.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "EmptyView.h"

#pragma mark - 声明
@interface EmptyView()

@property (nonatomic, strong) UIImageView *icon;     // 图片
@property (nonatomic, strong) UILabel *name;         // 描述
@property (nonatomic, strong) UILabel *desc;         // 描述
@property (nonatomic, strong) UILabel *again;        // 点击重试

@end

#pragma mark - 实现
@implementation EmptyView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
        [self setHidden:YES];
        [self setUserInteractionEnabled:YES];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initUI];
        [self setHidden:YES];
        [self setUserInteractionEnabled:YES];
    }
    return self;
}
- (void)initUI {
    [self setBackgroundColor:kColor_White];
    [self icon];
    [self name];
    [self desc];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_event) {
        _event();
    }
}

#pragma mark - 动画
- (void)show {
    self.hidden = NO;
    // 网络 - 图
    if (_state == EmptyStateNetkFailIcon) {
        self.icon.frame = CGRectMake(0, 0, self.width, self.width / 3);
        self.icon.center = CGPointMake(self.width / 2, 80 + self.icon.height / 2);
        self.icon.hidden = NO;
        self.icon.image = [UIImage imageNamed:[TimeTool isNight] ? @"cm2_act_offline_night" : @"cm2_act_offline"];
        self.icon.contentMode = UIViewContentModeScaleAspectFit;
        
        self.name.frame = CGRectMake(0, CGRectGetMaxY(self.icon.frame), self.width, 25);
        self.name.text = @"无可用网络";
        
        self.desc.frame = CGRectMake(0, CGRectGetMaxY(self.name.frame), self.width, 20);
        self.desc.hidden = NO;
        self.desc.text = @"检查云音乐网络连接权限及当前网络状态";
        
        self.again.frame = CGRectMake(0, CGRectGetMaxY(self.desc.frame) + 20, self.width / 3, 35);
        self.again.centerX = self.centerX;
        self.again.hidden = NO;
    }
    // 网络 - 文
    else if (_state == EmptyStateNetkFailPullRefresh) {
        self.icon.hidden = YES;
        
        self.name.frame = CGRectMake(0, 80 + self.name.height / 2, self.width, 25);
        self.name.text = @"请联网后查看";
        
        self.desc.frame = CGRectMake(0, CGRectGetMaxY(self.name.frame), self.width, 20);
        self.desc.hidden = NO;
        self.desc.text = @"下拉页面可以重新加载";
        
        self.again.hidden = YES;
    }
    // 网络 - 按钮
    else if (_state == EmptyStateNetkFailButton) {
        self.icon.hidden = YES;
        
        self.name.frame = CGRectMake(0, 80 + self.name.height / 2, self.width, 25);
        self.name.text = @"请联网后查看";
        
        self.desc.frame = CGRectMake(0, CGRectGetMaxY(self.name.frame), self.width, 20);
        self.desc.hidden = NO;
        self.desc.text = @"检查云音乐网络连接权限及当前网络状态";
        
        self.again.frame = CGRectMake(0, CGRectGetMaxY(self.desc.frame) + 20, self.width / 3, 35);
        self.again.centerX = self.centerX;
        self.again.hidden = NO;
    }
    // 无播放记录
    else if (_state == EmptyStatePlayRecordNone) {
        self.icon.hidden = YES;
        self.name.hidden = YES;
        self.desc.hidden = NO;
        self.again.hidden = YES;
        
        self.desc.frame = CGRectMake(0, 80 + self.name.height / 2, self.width, 25);
        self.desc.text = @"暂无播放记录";
    }
    // 无收藏歌曲
    else if (_state == EmptyStateCollectionNone) {
        self.icon.hidden = YES;
        self.name.hidden = YES;
        self.desc.hidden = NO;
        self.again.hidden = YES;
        
        self.desc.frame = CGRectMake(0, 80 + self.name.height / 2, self.width, 25);
        self.desc.text = @"你可以收藏喜欢的音乐到歌单";
    }
    // 正在加载
    else if (_state == EmptyStateLoading) {
        self.icon.hidden = YES;
        self.name.hidden = YES;
        self.desc.hidden = NO;
        self.again.hidden = YES;
        self.desc.frame = CGRectMake(0, 80 + self.name.height / 2, self.width, 25);
        self.desc.text = @"正在加载...";
    }
}
- (void)hide {
    [self setHidden:YES];
    [self removeFromSuperview];
}

#pragma mark - 设置
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}
- (void)setState:(EmptyState)state {
    _state = state;
    self.hidden = NO;
}

#pragma mark - get
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.userInteractionEnabled = NO;
        [self addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.userInteractionEnabled = NO;
        _name.font = NORMAL_FONT(16);
        _name.textColor = kColor_Text_Black;
        _name.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_name];
    }
    return _name;
}
- (UILabel *)desc {
    if (!_desc) {
        _desc = [[UILabel alloc] init];
        _desc.userInteractionEnabled = NO;
        _desc.font = NORMAL_FONT(12);
        _desc.textColor = kColor_Text_Gary;
        _desc.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_desc];
    }
    return _desc;
}
- (UILabel *)again {
    if (!_again) {
        _again = [[UILabel alloc] init];
        _again.userInteractionEnabled = NO;
        _again.font = NORMAL_FONT(12);
        _again.textColor = kColor_Text_Gary;
        _again.textAlignment = NSTextAlignmentCenter;
        _again.text = @"点击屏幕重新请求";
        [self addSubview:_again];
    }
    return _again;
}

@end

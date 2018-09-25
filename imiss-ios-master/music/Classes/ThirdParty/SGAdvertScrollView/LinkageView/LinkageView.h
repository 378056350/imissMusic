/**
 * 上下联动控件封装
 * @author 郑业强 2018-04-27 15:38
 * @update --
 */

#import "BaseView.h"
#import "LinkageConfig.h"

#pragma mark - 代理
@protocol LinkageViewDelegate<NSObject>

@optional
- (void)hookPageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex;
- (void)hookPageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex;

@end


#pragma mark - 声明
@interface LinkageView : BaseView

/// 配置信息
@property (nonatomic, strong) LinkageConfig *config;
/// 代理
@property (nonatomic, weak  ) id<LinkageViewDelegate> delegate;
/// 当前选中
@property (nonatomic, assign) NSInteger selectedIndex;

/// 初始化
+ (instancetype)initWithFrame:(CGRect)frame;
+ (instancetype)initWithFrame:(CGRect)frame vc:(BaseViewController *)vc;

@end

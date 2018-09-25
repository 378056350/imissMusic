/**
 * 上下联动控件封装
 * @author 郑业强 2018-04-27 15:38
 * @update --
 */

#import "SGAdvertScrollView.h"
#import "SGPagingView.h"
#import "LinkageView.h"

#pragma mark - 声明
@interface LinkageView ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>

@property (nonatomic, weak  ) BaseViewController *vc;
@property (nonatomic, strong) SGPageTitleView *name;
@property (nonatomic, strong) SGPageContentView *content;

@end

#pragma mark - 实现
@implementation LinkageView

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    LinkageView *view = [[LinkageView alloc] initWithFrame:frame];
    return view;
}
+ (instancetype)initWithFrame:(CGRect)frame vc:(BaseViewController *)vc {
    LinkageView *view = [self initWithFrame:frame];
    view.vc = vc;
    return view;
}
- (void)setConfig:(LinkageConfig *)config {
    _config = config;
    [self name];
    [self content];
}

// 排行
- (SGPageTitleView *)name {
    if (!_name) {
        SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
        configure.indicatorStyle = SGIndicatorStyleFixed;
        configure.titleSelectedFont = _config.titleSelectedFont;
        configure.titleFont = _config.titleFont;
        configure.titleSelectedColor = _config.titleSelectedColor;
        configure.titleColor = _config.titleColor;
        configure.indicatorColor = _config.indicatorColor;
        configure.indicatorFixedWidth = _config.indicatorFixedWidth;
        configure.indicatorAdditionalWidth = _config.indicatorAdditionalWidth;
        configure.bottomSeparatorColor = _config.bottomSeparatorColor;
        configure.indicatorHeight = 10;
        
        _name = [SGPageTitleView pageTitleViewWithFrame:_config.titleFrame delegate:self titleNames:_config.titles configure:configure];
        _name.backgroundColor = MainColor;
        [self addSubview:_name];
    }
    return _name;
}
// 内容
- (SGPageContentView *)content {
    if (!_content) {
        // 初始化
        _content = [[SGPageContentView alloc] initWithFrame:_config.contentFrame parentVC:_config.vc childVCs:_config.vcs];
        _content.delegatePageContentView = self;
        [self addSubview:_content];
    }
    return _content;
}
// 选中
- (NSInteger)selectedIndex {
    return _name.selectedIndex;
}


#pragma mark - SGPageTitleViewDelegate
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.content setPageContentViewCurrentIndex:selectedIndex];
    if (self.delegate && [self.delegate respondsToSelector:@selector(hookPageTitleView:selectedIndex:)]) {
        [self.delegate hookPageTitleView:pageTitleView selectedIndex:selectedIndex];
    }
}

#pragma mark - SGPageContentViewDelegate
- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    // NSLog(@"progress: %.2f  originalIndex: %ld  targetIndex: %ld", progress, originalIndex, targetIndex);
    [self.name setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
    if (self.delegate && [self.delegate respondsToSelector:@selector(hookPageContentView:progress:originalIndex:targetIndex:)]) {
        [self.delegate hookPageContentView:pageContentView progress:progress originalIndex:originalIndex targetIndex:targetIndex];
    }
}


@end

/**
 * 弹出框父控件
 * @author 郑业强 2018-06-14
 */

#import "BaseView.h"

#pragma mark - typeof
typedef NS_OPTIONS(NSUInteger, KKPopupStyle) {
    KKPopupStyleBottom = 0,    // 底部
    KKPopupStylePopup = 1,     // 弹出
};


#pragma mark - 声明
@interface KKPopupView : BaseView

@property (nonatomic, strong) id data;              // 数据
@property (nonatomic, weak  ) UIView *content;      // 内容
@property (nonatomic, assign) KKPopupStyle style;   // 样式
@property (nonatomic, strong) UIButton *shadow;
@property (nonatomic, assign) BOOL canClickShadow;  // 是否可以点击阴影

// 初始化
+ (instancetype)init;
// 显示
- (void)show;
//- (void)show:(void (^ __nullable)(BOOL finished))completion;
- (void)show:(void (^ __nullable)(void))animations;
- (void)show:(void (^ __nullable)(void))animations completion:(void (^ __nullable)(BOOL finished))completion;
// 隐藏
- (void)hide;
//- (void)hide:(void (^ __nullable)(BOOL finished))completion;
- (void)hide:(void (^ __nullable)(void))animations;
- (void)hide:(void (^ __nullable)(void))animations completion :(void (^ __nullable)(BOOL finished))completion;

@end

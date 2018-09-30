/**
 * 滑动时显示滚动行时间
 * @author 郑业强 2018-09-21
 */

#import "BaseView.h"

#pragma mark - typedef
typedef void (^MusicFlagClick)(void);

#pragma mark - 声明
@interface MusicFlag : BaseView

// 时间
@property (weak, nonatomic) IBOutlet UILabel *time;
// 点击
@property (nonatomic, copy  ) MusicFlagClick click;

@end

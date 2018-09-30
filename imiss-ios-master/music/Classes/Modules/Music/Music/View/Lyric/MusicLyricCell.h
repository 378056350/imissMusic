/**
 * 歌词Cell
 * @author 郑业强 2018-09-21
 */

#import "BaseTableCell.h"

@interface MusicLyricCell : BaseTableCell

// 是否选中
@property (nonatomic, assign, getter=isChoose) BOOL choose;
// 歌词
@property (nonatomic, copy  ) NSString *lrc;

// 是否选中
- (void)choose:(BOOL)choose alpha:(CGFloat)alpha animation:(BOOL)animation;

@end

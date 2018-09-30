/**
 * 歌词
 * @author 郑业强 2018-09-21
 */

#import "BaseView.h"
#import "ResourceModel.h"
#import "MusicModules.h"
#import "MusicFlag.h"

#pragma mark - 声明
@interface MusicLyric : BaseView

// 数据
@property (nonatomic, strong) ResourceModel *model;
// 标识
@property (nonatomic, strong) MusicFlag *flag;

// 获取当前行数
- (NSInteger)getIndex;
// 播放中
- (void)music:(MusicModules *)manager playing:(NSString *)music progress:(CGFloat)progress currentTime:(NSTimeInterval)currentTime totalTime:(NSTimeInterval)totalTime;


@end

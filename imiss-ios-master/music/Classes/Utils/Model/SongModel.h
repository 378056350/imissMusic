/**
 * 歌曲
 * @author 郑业强 2018-09-03
 */

#import "BaseModel.h"

@interface SongModel : BaseModel

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *album_id;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *isRecommend;
@property (nonatomic, strong) NSString *list_id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *singer_id;
@property (nonatomic, strong) NSString *small_img;

@end

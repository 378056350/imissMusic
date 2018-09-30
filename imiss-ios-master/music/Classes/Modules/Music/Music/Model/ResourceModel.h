//
//  ResourceModel.h
//  imiss
//
//  Created by MAC on 2018/9/13.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseModel.h"

@interface ResourceModel : BaseModel

// 歌名
@property (nonatomic, copy  ) NSString *name;
// 歌曲id
@property (nonatomic, copy  ) NSString *song;
// 歌词
@property (nonatomic, copy  ) NSString *lrc;
// 音乐
@property (nonatomic, copy  ) NSString *mp3;
// 数据
@property (nonatomic, strong) NSArray *datas;
// 歌词
@property (nonatomic, strong) NSMutableArray *lrcs;
// 时间
@property (nonatomic, strong) NSMutableArray *times;
// 秒数
@property (nonatomic, strong) NSMutableArray *seconds;

/// 获取行数 通过 秒数
- (NSInteger)getLineWithSecond:(NSTimeInterval)second;
/// 获取时间字符串 通过 行数
- (NSString *)getTimeWithLine:(NSInteger)line;
/// 获取时间字符串 通过 秒数
- (NSString *)getTimeWithSecond:(NSTimeInterval)sec;
/// 获取秒数 通过 行数
- (NSTimeInterval)getSecondWithLine:(NSInteger)line;


@end

//
//  SongModel.h
//  music
//
//  Created by 郑业强 on 2018/9/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseModel.h"
#import "SongModel.h"

// 歌曲列表
@interface HomePupularListModel : BaseModel

// 歌曲列表
@property (nonatomic, strong) NSMutableArray<SongModel *> *song;
// 受欢迎歌曲
@property (nonatomic, strong) NSString *popular_count;

@end

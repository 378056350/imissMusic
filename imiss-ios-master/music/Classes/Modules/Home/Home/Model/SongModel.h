//
//  SongModel.h
//  music
//
//  Created by 郑业强 on 2018/10/1.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseModel.h"

// 歌曲
@interface SongModel : BaseModel

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *big_img;
@property (nonatomic, strong) NSString *small_img;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *likeNumber;
@property (nonatomic, strong) NSString *listenNumber;
@property (nonatomic, strong) NSString *shareNumber;

@end

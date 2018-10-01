//
//  HomeRealmModel.h
//  imiss
//
//  Created by 郑业强 on 2018/9/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Realm/Realm.h>
#import "SheetRealmModel.h"
#import "SongRealmModel.h"

// 轮播图
@interface HomeCarouselRealmModel : RLMObject

@property NSString *img;
@property NSString *album_id;
@property NSString *list_id;
@property NSString *singer_id;

@end

RLM_ARRAY_TYPE(HomeCarouselRealmModel)

// 数据
@interface HomeRealmModel : RLMObject

@property RLMArray<HomeCarouselRealmModel> *carousel;   // 轮播图
@property RLMArray<SheetRealmModel> *sheet;           // 歌单
@property RLMArray<SongRealmModel> *song;             // 歌曲

@end

RLM_ARRAY_TYPE(HomeRealmModel)
